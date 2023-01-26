#' 2021-2 NHL Team Statistics
#'
#' A dataset containing the NHL Statistics
#'
#' @format A data frame with 32 rows and 35 variables:
#' \describe{
#'   \item{stat_games_played}{Season in which the game was played (YYYY)}
#'   \item{stat_wins}{Season in which the game was played (YYYY-YY)}
#'   \item{stat_losses}{Always given as NBA}
#'   \item{stat_ot}{Regular season data}
#'   \item{stat_pts}{Date in YYYY-MM-DD}
#'   \item{stat_pt_pctg}{Game ID on nba.com}
#'   \item{stat_goals_per_game}{slugTeam game number in the season}
#'   \item{stat_goals_against_per_game}{Full team name}
#'   \item{stat_ev_gga_ratio}{Team ID on nba.com}
#'   \item{stat_power_play_percentage}{Logical for back-to-back game}
#'   \item{stat_power_play_goals}{Logical for first game of back-to-back game}
#'   \item{stat_power_play_goals_against}{Logical for second game of back-to-back game}
#'   \item{stat_power_play_opportunities}{Home (H) or Away (A)}
#'   \item{stat_penalty_kill_percentage}{Team One vs. Team Two}
#'   \item{stat_shots_per_game}{Team abbreviation}
#'   \item{stat_shots_allowed}{Days between previous game and this game}
#'   \item{stat_win_score_first}{Days until next game}
#'   \item{stat_win_opp_score_first}{Opponent abbreviation}
#'   \item{stat_win_lead_first_per}{Team that won (abbreviation)}
#'   \item{stat_win_lead_second_per}{Team that lost (abbreviation)}
#'   \item{stat_win_outshoot_opp}{Result for slugTeam (W or L)}
#'   \item{stat_win_outshot_by_opp}{Logical for slugTeam winning}
#'   \item{stat_face_offs_taken}{slugTeam field goals made}
#'   \item{stat_face_offs_won}{slugTeam field goal attempts}
#'   \item{stat_face_offs_lost}{slugTeam field goal percentage}
#'   \item{stat_face_off_win_percentage}{slugTeam three point field goals made}
#'   \item{stat_shooting_pctg}{slugTeam three point field goal attempts}
#'   \item{stat_penalty_kill_opportunities}{slugTeam three point field goal percentage}
#'   \item{stat_save_pct_rank}{slugTeam free throw percentage}
#'   \item{stat_shooting_pct_rank}{Logical if game video exists}
#'   \item{team_id}{slugTeam two point field goals made}
#'   \item{team_name}{slugTeam free throw percentage}
#'   \item{team_link}{Logical if game video exists}
#'   \item{season}{slugTeam two point field goals made}
#' }
#' @source \url{https://statsapi.web.nhl.com/api/v1}
"nhl_team_stats_2021"
