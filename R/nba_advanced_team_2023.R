#' NBA Advanced Statistics (Team) for the 2022-23 Season
#'
#' A dataset containing the NBA Four Factor table on nba.com
#'
#' @format A data frame with 2460 rows and 29 variables:
#' \describe{
#'   \item{game_id}{Game ID on nba.com}
#'   \item{team_id}{Team ID on nba.com}
#'   \item{team_name}{Team name}
#'   \item{team_abbreviation}{Team abbreviation}
#'   \item{team_city}{Team city}
#'   \item{min}{Total minutes in the game}
#'   \item{e_off_rating}{offensive rating (effective ?)}
#'   \item{off_rating}{offensive rating}
#'   \item{e_def_rating}{defensive rating (effective ?)}
#'   \item{def_rating}{defensive rating}
#'   \item{e_net_rating}{net rating (effective ?)}
#'   \item{net_rating}{net rating}
#'   \item{ast_pct}{Assist percentage}
#'   \item{ast_tov}{Assists to turnover ratio}
#'   \item{ast_ratio}{Assist ratio}
#'   \item{oreb_pct}{Offensive rebound percentage}
#'   \item{dreb_pct}{Defensive rebound percentage}
#'   \item{reb_pct}{Total rebound percentage}
#'   \item{e_tm_tov_pct}{Turnover percentage (effective?)}
#'   \item{tm_tov_pct}{Turnover percentage}
#'   \item{efg_pct}{Effective field goal percentage}
#'   \item{ts_pct}{True Shooting percentage}
#'   \item{usg_pct}{Usage percentage}
#'   \item{e_usg_pct}{Usage percentage (effective?)}
#'   \item{e_pace}{pace (effective ?)}
#'   \item{pace}{pace}
#'   \item{pace_per40}{pace per forty minutes}
#'   \item{poss}{team possessions in game}
#'   \item{pie}{Player impact estimate}
#' }
#' @source \url{http://asbcllc.com/nbastatR/reference/box_scores.html}
"nba_adv_team_2023"
