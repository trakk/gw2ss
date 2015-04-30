-- gw2ss: simple tracking and reporting of GW2 salvage rates
-- Copyright (C) 2015  David Ulrich
-- 
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Affero General Public License as published
-- by the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
-- 
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU Affero General Public License for more details.
-- 
-- You should have received a copy of the GNU Affero General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.

local reports = {
	{
		title = "Stats",
		query = [[
			SELECT
				T.TierName,
				COUNT(*) AS Salvages,
				SUM(SalvageEcto) AS SalvageEcto,
				SUM(SalvageDark) AS SalvageDark,
				SUM(SalvageEcto) / SUM(1) AS EctoRate,
				SUM(SalvageDark) / SUM(1) AS DarkRate
			FROM salvages S
			LEFT JOIN tiers T ON S.TierID = T.TierID
			GROUP BY S.TierID
		]],
		fields = {
			"TierName",
			"Salvages",
			"SalvageEcto",
			"SalvageDark",
			"EctoRate",
			"DarkRate"
		},
		titles = {
			"Tier",
			"Total",
			"Ecto #",
			"Dark #",
			"Ecto %",
			"Dark %"
		}
	}
}

return reports