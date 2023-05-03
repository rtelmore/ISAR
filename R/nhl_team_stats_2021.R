#' 2021-2 NHL Team Statistics
#'
#' A dataset containing the NHL Statistics
#'
#' @format A data frame with 32 rows and 35 variables:
#' \describe{
#'   \item{stat_games_played}{Games played}
#'   \item{stat_wins}{Wins}
#'   \item{stat_losses}{Losses}
#'   \item{stat_ot}{Overtimes}
#'   \item{stat_pts}{Points}
#'   \item{stat_pt_pctg}{Point Percentage}
#'   \item{stat_goals_per_game}{Goals per game}
#'   \item{stat_goals_against_per_game}{Goals against per game}
#'   \item{stat_ev_gga_ratio}{Even strength gga ratio}
#'   \item{stat_power_play_percentage}{Power play percentage}
#'   \item{stat_power_play_goals}{Power play goals}
#'   \item{stat_power_play_goals_against}{Power play goals against}
#'   \item{stat_power_play_opportunities}{Power play opportunities}
#'   \item{stat_penalty_kill_percentage}{Penalty kill percentage}
#'   \item{stat_shots_per_game}{Shots per game}
#'   \item{stat_shots_allowed}{Shots allowed}
#'   \item{stat_win_score_first}{Wins when scoring first}
#'   \item{stat_win_opp_score_first}{Wins when opponent scores first}
#'   \item{stat_win_lead_first_per}{Wins when leading after first period}
#'   \item{stat_win_lead_second_per}{Wins when leading after second period}
#'   \item{stat_win_outshoot_opp}{Wins when outshooting opponent}
#'   \item{stat_win_outshot_by_opp}{Wins when outshot by opponent}
#'   \item{stat_face_offs_taken}{Face-offs taken}
#'   \item{stat_face_offs_won}{Face-offs won}
#'   \item{stat_face_offs_lost}{Face-offs lost}
#'   \item{stat_face_off_win_percentage}{Face-off win percentage}
#'   \item{stat_shooting_pctg}{Shooting percentage}
#'   \item{stat_save_pctg}{Save percentage}
#'   \item{stat_penalty_kill_opportunities}{Penalty kill opportunities}
#'   \item{stat_save_pct_rank}{Save percentage rank}
#'   \item{stat_shooting_pct_rank}{Shooting percentage rank}
#'   \item{team_id}{Team ID}
#'   \item{team_name}{Team name}
#'   \item{team_link}{Team link}
#'   \item{season}{Season}
#' }
#' @source \url{https://www.nhl.com/stats/}
"nhl_team_stats_2021"
