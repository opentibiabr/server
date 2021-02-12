/**
 * The Forgotten Server - a free and open-source MMORPG server emulator
 * Copyright (C) 2021 Mark Samman <mark.samman@gmail.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */

#include "otpch.h"

#include "scripts.h"
#include <boost/filesystem.hpp>
#include "configmanager.h"

extern LuaEnvironment g_luaEnvironment;

Scripts::Scripts() :
	scriptInterface("Scripts Interface")
{
	scriptInterface.initState();
}

Scripts::~Scripts()
{
	scriptInterface.reInitState();
}

bool Scripts::loadEventSchedulerScripts(const std::string& fileName)
{
	namespace fs = boost::filesystem;

	const auto dir = fs::current_path() / "data" / "events" / "scripts" / "scheduler";
	if(!fs::exists(dir) || !fs::is_directory(dir)) {
		spdlog::error("[Scripts::loadEventSchedulerScripts] - "
                    "Can not load folder 'scheduler' on '/data/events/scripts'");
		return false;
	}

	fs::recursive_directory_iterator endit;
	for(fs::recursive_directory_iterator it(dir); it != endit; ++it) {
		if(fs::is_regular_file(*it) && it->path().extension() == ".lua") {
			if (it->path().filename().string() == fileName) {
				if(scriptInterface.loadFile(it->path().string()) == -1) {
					spdlog::error("{}", it->path().string());
					spdlog::error("{}", scriptInterface.getLastLuaError());
					continue;
				}
				return true;
			}
		}
	}
	return false;
}

bool Scripts::loadScripts(std::string folderName, bool isLib, bool reload)
{
	namespace fs = boost::filesystem;

	const auto dir = fs::current_path() / "data" / folderName;
	if(!fs::exists(dir) || !fs::is_directory(dir)) {
		spdlog::warn("[Scripts::loadScripts] - "
                    "Can not load folder '{}'", folderName);
		return false;
	}

	fs::recursive_directory_iterator endit;
	std::vector<fs::path> v;
	std::string disable = ("#");
	for(fs::recursive_directory_iterator it(dir); it != endit; ++it) {
		auto fn = it->path().parent_path().filename();
		if ((fn == "lib" && !isLib) || fn == "events") {
			continue;
		}
		if(fs::is_regular_file(*it) && it->path().extension() == ".lua") {
			size_t found = it->path().filename().string().find(disable);
			if (found != std::string::npos) {
				if (g_config().getBoolean(ConfigManager::SCRIPTS_CONSOLE_LOGS)) {
					spdlog::info("{} [disabled]", it->path().filename().string());
				}
				continue;
			}
			v.push_back(it->path());
		}
	}
	sort(v.begin(), v.end());
	std::string redir;
	for (auto it = v.begin(); it != v.end(); ++it) {
		const std::string scriptFile = it->string();
		if (!isLib) {
			if (redir.empty() || redir != it->parent_path().string()) {
				auto p = it->relative_path();
				if (g_config().getBoolean(ConfigManager::SCRIPTS_CONSOLE_LOGS)) {
					spdlog::info("[{}]", p.parent_path().filename().string());
				}
				redir = it->parent_path().string();
			}
		}

		if(scriptInterface.loadFile(scriptFile) == -1) {
			spdlog::error("{} ", it->filename().string());
			spdlog::error("{} ", scriptInterface.getLastLuaError());
			continue;
		}

		if (g_config().getBoolean(ConfigManager::SCRIPTS_CONSOLE_LOGS)) {
			if (!reload) {
				spdlog::info("{} [loaded]", it->filename().string());
			} else {
				spdlog::info("{] [reloaded]", it->filename().string());
			}
		}
	}

	return true;
}