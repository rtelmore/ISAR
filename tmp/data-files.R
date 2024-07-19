## Ryan Elmore
## Organizing the Data for Book
## 24 Oct 2020

library(janitor)
library(dplyr)
#remotes::install_github(repo = "saiemgilani/hoopR")
library(hoopR)
library(nhlapi)
library(purrr)
library(readxl)
library(wehoop)
library(rvest)

is_all_numeric <- function(x) {
  !any(is.na(suppressWarnings(as.numeric(na.omit(x))))) & is.character(x)
}

## NBA Data
nba_games_2021 <- readRDS("~/research/isar-code/data/nba-games-2021.rds")
usethis::use_data(nba_games_2021, overwrite = T)
nba_adv_team_2021 <- readRDS("~/research/isar-code/data/advanced-team-end-2021.rds")
usethis::use_data(nba_adv_team_2021, overwrite = T)
nba_ff_team_2021 <- readRDS("~/research/isar-code/data/four-factors-team-2021.rds")
usethis::use_data(nba_ff_team_2021, overwrite = T)
nba_nuggets_shots <- readRDS("~/research/ISAR/tmp/nuggets-2015-23.rds")
usethis::use_data(nba_nuggets_shots, overwrite = T)

nba_games_2023 <- readRDS("~/research/ISAR/tmp/nba-games-end-2023.rds")
nba_games_2023[9:29] <- sapply(nba_games_2023[9:29], as.numeric)
nba_games_2023$game_date <- lubridate::ymd(nba_games_2023$game_date)
usethis::use_data(nba_games_2023, overwrite = T)

nba_adv_team_2023 <- readRDS("~/research/ISAR/tmp/adv-team-2023.rds")
nba_adv_team_2023[7:29] <- sapply(nba_adv_team_2023[7:29], as.numeric)
nba_adv_team_2023$min <- as.numeric(substr(nba_adv_team_2023$min, 1, 3))
usethis::use_data(nba_adv_team_2023, overwrite = T)

nba_ff_team_2023 <- readRDS("~/research/ISAR/tmp/ff-team-2023.rds")
nba_ff_team_2023[7:14] <- sapply(nba_ff_team_2023[7:14], as.numeric)
nba_ff_team_2023$min <- as.numeric(substr(nba_ff_team_2023$min, 1, 3))
usethis::use_data(nba_ff_team_2023, overwrite = T)

## Draftkings
dk_lac_dal <- read.csv("~/research/isar-code/data/DKSalaries.csv",
                       stringsAsFactors = F) %>%
  janitor::clean_names()
usethis::use_data(dk_lac_dal, overwrite = T)
dk_mem_utah <- read.csv("~/research/isar-code/data/DKSalaries-lab.csv",
                        stringsAsFactors = F) %>%
  janitor::clean_names()
usethis::use_data(dk_mem_utah, overwrite = T)

dk_nyr_car <- read.csv("~/research/isar-code/data/DKSalaries-NYR-CAR.csv",
                        stringsAsFactors = F) |>
  janitor::clean_names()
usethis::use_data(dk_nyr_car, overwrite = T)

dk_edm_col <- read.csv("~/research/isar-code/data/DKSalaries-EDM-COL.csv",
                       stringsAsFactors = F) |>
  janitor::clean_names()
usethis::use_data(dk_edm_col, overwrite = T)

## NWSL
nwsl_player_stats <- read.csv("../isar-code/data/nwsl-players.csv", header = T,
                              encoding = "UTF-8") |>
  janitor::clean_names() |>
  dplyr::select(c(2:6, 8:10, 28:32)) |>
  dplyr::rename(xGp90 = x_g_1,
                xAp90 = x_ag_1,
                xGxAp90 = x_g_x_ag,
                npxGp90 = npx_g_1,
                npxGxAp90 = npx_g_x_ag_1)
#nwsl_player_stats <- readRDS("~/research/isar-code/data/nwsl_player_stats.rds")
usethis::use_data(nwsl_player_stats, overwrite = T)

## Golf
pga_tournaments <- read.csv("~/research/isar-code/data/pga-tourney-level-raw-data.csv",
                            header = TRUE, sep = ",")
usethis::use_data(pga_tournaments, overwrite = T)

ow_golf_rankings <- read.csv("~/research/isar-code/data/owgr-230222.csv",
                             header = TRUE, sep = ",")
usethis::use_data(ow_golf_rankings, overwrite = T)

masters <- readxl::read_xlsx("tmp/2019-Masters.xlsx") %>%
  janitor::clean_names(.) %>%
  dplyr::select(., pos, player_name, nationality, score, round_1, round_2,
                round_3, round_4, total)
masters <- as.data.frame(masters)
usethis::use_data(masters)

## NHL Stuff

team_stats <- nhlapi::nhl_teams_stats(teamIds = NULL, seasons = 2022)
nhl_team_stats_2022 <- purrr::map_df(team_stats$teamStats,
                                     function(x){
                                       return(x[[1]])
                                     }) |>
  dplyr::filter(stat.gamesPlayed != "NA") |>
  dplyr::mutate(season = rep(2022, each = 32)) |>
  janitor::clean_names() |>
  dplyr::mutate_if(is_all_numeric, as.numeric)
usethis::use_data(nhl_team_stats_2022, overwrite = T)

avs_roster_2022 <- nhlapi::nhl_teams_rosters(teamIds = 21)$roster.roster[[1]] |>
  janitor::clean_names() |>
  dplyr::mutate_if(is_all_numeric, as.numeric)
usethis::use_data(avs_roster_2022, overwrite = T)

avs_stats <- nhlapi::nhl_players_allseasons(playerIds = avs_roster_2022$person_id) |>
  janitor::clean_names()
avs_stats_2022 <-  dplyr::inner_join(avs_roster_2022 |>
                                       dplyr::select(person_id, person_full_name),
                                     avs_stats,
                                     by = c("person_id" = "player_id")) |>
  dplyr::filter(league_name == "National Hockey League") |>
  dplyr::select(person_id, person_full_name, tidyr::starts_with("season"),
                tidyr::starts_with("stat"), tidyr::starts_with("team")) |>
  janitor::clean_names() |>
  dplyr::mutate_if(is_all_numeric, as.numeric)

usethis::use_data(avs_stats_2022, overwrite = T)

years <- 2012:2023
for(i in seq_along(years)){
  cat(sprintf('Year: %s at %s\n', years[i], Sys.time()))
  reg_url <- paste("https://www.hockey-reference.com/leagues/NHL_", years[i],
                   "_skaters.html", sep = "")
  pg <- read_html(reg_url)
  nhl_reg_stats <- rvest::html_table(pg, fill = TRUE)[[1]]
  names(nhl_reg_stats) <- nhl_reg_stats[1, ]
  nhl_reg_stats_2 <- janitor::clean_names(nhl_reg_stats) |>
    filter(rk != "Rk")

  adv_url <- paste("https://www.hockey-reference.com/leagues/NHL_", years[i],
                   "_skaters-advanced.html", sep = "")
  pg_2 <- read_html(adv_url)
  nhl_adv_stats <- rvest::html_table(pg_2, fill = TRUE)[[1]]
  names(nhl_adv_stats) <- nhl_adv_stats[1, ]
  nhl_adv_stats_2 <- janitor::clean_names(nhl_adv_stats) |>
    filter(rk != "Rk")

  tmp_results <- dplyr::inner_join(nhl_reg_stats_2, nhl_adv_stats_2) |>
    mutate(season = years[i]) |>
    select(-rk)

  if(exists("nhl_data")){
    nhl_data <- dplyr::bind_rows(nhl_data, tmp_results)
  }
  else(nhl_data <- tmp_results)

}

nhl_data[, -c(1, 3, 4, 22, 41, 42)] <- sapply(nhl_data[, -c(1, 3, 4, 22, 41, 42)],
                                              as.numeric )
nhl_data_hockey_reference <- nhl_data |>
  rename(eva = ev_2,
         ppa = pp_2,
         sha = sh_2)
usethis::use_data(nhl_data_hockey_reference, overwrite = T)

## EPL (2021 - 2022)
epl_player_stats_2022 <- read.csv("tmp/epl.csv", encoding = "UTF-8")
names(epl_player_stats_2022) <- epl_player_stats_2022[1, ]
epl_player_stats_2022 <- epl_player_stats_2022[-1, ] |>
  janitor::clean_names() |>
  dplyr::select(-rk, -matches, -x9999) |>
  dplyr::rename(min_p90 = x90s,
                goals = gls,
                assists = ast,
                goals_assists = g_a,
                non_pen_goals = g_pk,
                pen_goals = pk,
                pen_att = p_katt,
                yellow_cards = crd_y,
                red_cards = crd_r,
                xG = x_g,
                non_pen_xG = npx_g,
                xA = x_ag,
                non_pen_xGxA = npx_g_x_ag,
                prg_carry = prg_c,
                prg_pass = prg_p,
                prg_reception = prg_r,
                goals_p90 = gls_2,
                assists_p90 = ast_2,
                goals_assists_p90 = g_a_2,
                non_pen_goals_p90 = g_pk_2,
                non_pen_goals_assists_p90 = g_a_pk,
                xG_p90 = x_g_2,
                xA_p90 = x_ag_2,
                xG_xA_p90 = x_g_x_ag,
                non_pen_xG_p90 = npx_g_2,
                non_pen_xG_xA_p90 = npx_g_x_ag_2) |>
  dplyr::filter(player != "Sonny Perkins") |>
  mutate_if(is_all_numeric, as.numeric)
usethis::use_data(epl_player_stats_2022, overwrite = T)

epl_gk_stats_2022 <- read.csv("tmp/epl-adv-gk.csv", encoding = "UTF-8")
names(epl_gk_stats_2022) <- epl_gk_stats_2022[1, ]
epl_gk_stats_2022 <- epl_gk_stats_2022[-1, ] |>
  janitor::clean_names() |>
  dplyr::select(-rk, -matches, -x9999) |>
  dplyr::rename(min_p90 = x90s,
                goals = ga,
                pk_allowed = pka,
                free_kick_goals = fk,
                corner_kick_goals = ck,
                own_goals_against = og,
                post_shot_xG = p_sx_g,
                post_shot_xG_per_shot_on_target = p_sx_g_so_t,
                post_shot_xG_minus_goals = p_sx_g_2,
                post_shot_xG_minus_goals_p90 = x90,
                launch_completed = cmp,
                launch_attempt = att,
                launch_completion_percent = cmp_percent,
                pass_attempt = att_2,
                throw_attempt = thr,
                pass_launch_percent = launch_percent,
                avg_pass_len = avg_len,
                goal_kick_attempt = att_3,
                gk_launch_percent = launch_percent_2,
                avg_gk_len = avg_len_2,
                crosses_faced = opp,
                crosses_stopped = stp,
                stop_percent = stp_percent,
                def_actions_out_pen_area = number_opa,
                def_actions_out_pen_area_p90 = number_opa_90,
                avg_dist_def_actions = avg_dist) |>
  mutate_if(is_all_numeric, as.numeric)

usethis::use_data(epl_gk_stats_2022, overwrite = T)

epl_team_stats <- readxl::read_xlsx("tmp/epl-team-stats.xlsx") |>
  janitor::clean_names() |>
  dplyr::rename(num_players = number_pl,
                goals = gls_6,
                assists = ast_7,
                goals_assists = g_a_8,
                non_pen_goals = g_pk_9,
                pen_goals = pk,
                pen_att = p_katt,
                yellow_cards = crd_y,
                red_cards = crd_r,
                xG = x_g_14,
                non_pen_xG = npx_g_15,
                xA = x_ag_16,
                non_pen_xGxA = npx_g_x_ag_17,
                prg_carry = prg_c,
                prg_pass = prg_p,
                goals_p90 = gls_20,
                assists_p90 = ast_21,
                goals_assists_p90 = g_a_22,
                non_pen_goals_p90 = g_pk_23,
                non_pen_goals_assists_p90 = g_a_pk,
                xG_p90 = x_g_25,
                xA_p90 = x_ag_26,
                xG_xA_p90 = x_g_x_ag,
                non_pen_xG_p90 = npx_g_28,
                non_pen_xG_xA_p90 = npx_g_x_ag_29) |>
  mutate_if(is_all_numeric, as.numeric)

usethis::use_data(epl_team_stats, overwrite = T)

## EPL 2022-23
library(worldfootballR)

player_stats_2023 <- fb_big5_advanced_season_stats(season_end_year = 2023,
                                                   stat_type = "standard",
                                                   team_or_player = "player",
                                                   time_pause = 3)
epl_player_stats_2023 <- player_stats_2023 |>
  filter(Comp == "Premier League") |>
  janitor::clean_names() |>
  dplyr::rename(mp = mp_playing,
                starts = starts_playing,
                min = min_playing,
                min_p90 = mins_per_90_playing,
                goals = gls,
                assists = ast,
                goals_assists = g_a,
                non_pen_goals = g_minus_pk,
                pen_goals = pk,
                pen_att = p_katt,
                yellow_cards = crd_y,
                red_cards = crd_r,
                xG = x_g_expected,
                non_pen_xG = npx_g_expected,
                xA = x_ag_expected,
                non_pen_xGxA = npx_g_x_ag_expected,
                prg_carry = prg_c_progression,
                prg_pass = prg_p_progression,
                prg_reception = prg_r_progression,
                goals_p90 = gls_per,
                assists_p90 = ast_per,
                goals_assists_p90 = g_a_per,
                non_pen_goals_p90 = g_minus_pk_per,
                non_pen_goals_assists_p90 = g_a_minus_pk_per,
                xG_p90 = x_g_per,
                xA_p90 = x_ag_per,
                xG_xA_p90 = x_g_x_ag_per,
                non_pen_xG_p90 = npx_g_per,
                non_pen_xG_xA_p90 = npx_g_x_ag_per)

usethis::use_data(epl_player_stats_2023, overwrite = T)

player_stats_2024 <- fb_big5_advanced_season_stats(season_end_year = 2024,
                                                   stat_type = "standard",
                                                   team_or_player = "player",
                                                   time_pause = 3)
epl_player_stats_2024 <- player_stats_2023 |>
  filter(Comp == "Premier League") |>
  janitor::clean_names() |>
  dplyr::rename(mp = mp_playing,
                starts = starts_playing,
                min = min_playing,
                min_p90 = mins_per_90_playing,
                goals = gls,
                assists = ast,
                goals_assists = g_a,
                non_pen_goals = g_minus_pk,
                pen_goals = pk,
                pen_att = p_katt,
                yellow_cards = crd_y,
                red_cards = crd_r,
                xG = x_g_expected,
                non_pen_xG = npx_g_expected,
                xA = x_ag_expected,
                non_pen_xGxA = npx_g_x_ag_expected,
                prg_carry = prg_c_progression,
                prg_pass = prg_p_progression,
                prg_reception = prg_r_progression,
                goals_p90 = gls_per,
                assists_p90 = ast_per,
                goals_assists_p90 = g_a_per,
                non_pen_goals_p90 = g_minus_pk_per,
                non_pen_goals_assists_p90 = g_a_minus_pk_per,
                xG_p90 = x_g_per,
                xA_p90 = x_ag_per,
                xG_xA_p90 = x_g_x_ag_per,
                non_pen_xG_p90 = npx_g_per,
                non_pen_xG_xA_p90 = npx_g_x_ag_per)

usethis::use_data(epl_player_stats_2024, overwrite = T)

gk_stats_2023 <- fb_big5_advanced_season_stats(season_end_year = 2023,
                                                   stat_type = "keepers_adv",
                                                   team_or_player = "player",
                                                   time_pause = 3)
epl_gk_stats_2023 <- gk_stats_2023 |>
  filter(Comp == "Premier League") |>
  janitor::clean_names() |>
  dplyr::rename(min_p90 = mins_per_90,
                goals = ga_goals,
                pk_allowed = pka_goals,
                free_kick_goals = fk_goals,
                corner_kick_goals = ck_goals,
                own_goals_against = og_goals,
                post_shot_xG = p_sx_g_expected,
                post_shot_xG_per_shot_on_target = p_sx_g_per_so_t_expected,
                post_shot_xG_minus_goals = p_sx_g_per_minus_expected,
                post_shot_xG_minus_goals_p90 = per_90_expected,
                launch_completed = cmp_launched,
                launch_attempt = att_launched,
                launch_completion_percent = cmp_percent_launched,
                pass_attempt = att_gk_passes,
                throw_attempt = thr_passes,
                pass_launch_percent = launch_percent_passes,
                avg_pass_len = avg_len_passes,
                goal_kick_attempt = att_goal,
                gk_launch_percent = launch_percent_goal,
                avg_gk_len = avg_len_goal,
                crosses_faced = opp_crosses,
                crosses_stopped = stp_crosses,
                stop_percent = stp_percent_crosses,
                def_actions_out_pen_area = number_opa_sweeper,
                def_actions_out_pen_area_p90 = number_opa_per_90_sweeper,
                avg_dist_def_actions = avg_dist_sweeper)

usethis::use_data(epl_gk_stats_2023, overwrite = T)

gk_stats_2024 <- fb_big5_advanced_season_stats(season_end_year = 2024,
                                               stat_type = "keepers_adv",
                                               team_or_player = "player",
                                               time_pause = 3)
epl_gk_stats_2024 <- gk_stats_2024 |>
  filter(Comp == "Premier League") |>
  janitor::clean_names() |>
  dplyr::rename(min_p90 = mins_per_90,
                goals = ga_goals,
                pk_allowed = pka_goals,
                free_kick_goals = fk_goals,
                corner_kick_goals = ck_goals,
                own_goals_against = og_goals,
                post_shot_xG = p_sx_g_expected,
                post_shot_xG_per_shot_on_target = p_sx_g_per_so_t_expected,
                post_shot_xG_minus_goals = p_sx_g_per_minus_expected,
                post_shot_xG_minus_goals_p90 = per_90_expected,
                launch_completed = cmp_launched,
                launch_attempt = att_launched,
                launch_completion_percent = cmp_percent_launched,
                pass_attempt = att_gk_passes,
                throw_attempt = thr_passes,
                pass_launch_percent = launch_percent_passes,
                avg_pass_len = avg_len_passes,
                goal_kick_attempt = att_goal,
                gk_launch_percent = launch_percent_goal,
                avg_gk_len = avg_len_goal,
                crosses_faced = opp_crosses,
                crosses_stopped = stp_crosses,
                stop_percent = stp_percent_crosses,
                def_actions_out_pen_area = number_opa_sweeper,
                def_actions_out_pen_area_p90 = number_opa_per_90_sweeper,
                avg_dist_def_actions = avg_dist_sweeper)

usethis::use_data(epl_gk_stats_2024, overwrite = T)

team_stats_2023 <- fb_big5_advanced_season_stats(season_end_year = 2023,
                                                 stat_type = "standard",
                                                 team_or_player = "team",
                                                 time_pause = 3)

epl_team_stats_2023 <- team_stats_2023 |>
  filter(Comp == "Premier League", Team_or_Opponent == "team") |>
  janitor::clean_names() |>
  dplyr::select(-team_or_opponent, -mp_playing, -starts_playing, -min_playing,
                -mins_per_90_playing) |>
  dplyr::rename(goals = gls,
                assists = ast,
                goals_assists = g_a,
                non_pen_goals = g_minus_pk,
                pen_goals = pk,
                pen_att = p_katt,
                yellow_cards = crd_y,
                red_cards = crd_r,
                xG = x_g_expected,
                non_pen_xG = npx_g_expected,
                xA = x_ag_expected,
                non_pen_xGxA = npx_g_x_ag_expected,
                prg_carry = prg_c_progression,
                prg_pass = prg_p_progression,
                goals_p90 = gls_per,
                assists_p90 = ast_per,
                goals_assists_p90 = g_a_per,
                non_pen_goals_p90 = g_minus_pk_per,
                non_pen_goals_assists_p90 = g_a_minus_pk_per,
                xG_p90 = x_g_per,
                xA_p90 = x_ag_per,
                xG_xA_p90 = x_g_x_ag_per,
                non_pen_xG_p90 = npx_g_per,
                non_pen_xG_xA_p90 = npx_g_x_ag_per)

usethis::use_data(epl_team_stats_2023, overwrite = T)

team_stats_2024 <- fb_big5_advanced_season_stats(season_end_year = 2024,
                                                 stat_type = "standard",
                                                 team_or_player = "team",
                                                 time_pause = 3)

epl_team_stats_2024 <- team_stats_2024 |>
  filter(Comp == "Premier League", Team_or_Opponent == "team") |>
  janitor::clean_names() |>
  dplyr::select(-team_or_opponent, -mp_playing, -starts_playing, -min_playing,
                -mins_per_90_playing) |>
  dplyr::rename(goals = gls,
                assists = ast,
                goals_assists = g_a,
                non_pen_goals = g_minus_pk,
                pen_goals = pk,
                pen_att = p_katt,
                yellow_cards = crd_y,
                red_cards = crd_r,
                xG = x_g_expected,
                non_pen_xG = npx_g_expected,
                xA = x_ag_expected,
                non_pen_xGxA = npx_g_x_ag_expected,
                prg_carry = prg_c_progression,
                prg_pass = prg_p_progression,
                goals_p90 = gls_per,
                assists_p90 = ast_per,
                goals_assists_p90 = g_a_per,
                non_pen_goals_p90 = g_minus_pk_per,
                non_pen_goals_assists_p90 = g_a_minus_pk_per,
                xG_p90 = x_g_per,
                xA_p90 = x_ag_per,
                xG_xA_p90 = x_g_x_ag_per,
                non_pen_xG_p90 = npx_g_per,
                non_pen_xG_xA_p90 = npx_g_x_ag_per)

usethis::use_data(epl_team_stats_2024, overwrite = T)

## WNBA

df <- wehoop::load_wnba_pbp(2021) |>
  dplyr::filter((home_team_name == "Seattle" |
                   away_team_name == "Seattle"),
                shooting_play == "TRUE",
                !grepl("Free", type_text),
                coordinate_y < 45)

df_player <- wehoop::load_wnba_player_box(2021) |>
  dplyr::filter(team_short_display_name == "Storm") |>
  dplyr::select(athlete_display_name, athlete_id, team_short_display_name) |>
  dplyr::distinct()

df_game <- df |>
  dplyr::filter((home_team_name == "Seattle" |
                   away_team_name == "Seattle"),
                shooting_play == "TRUE",
                !grepl("Free", type_text),
                coordinate_y < 45)
