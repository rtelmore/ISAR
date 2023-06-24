#' NBA Game Logs for the 2022-23 Season
#'
#' A dataset containing the NBA Games table on nba.com
#'
#' @format A data frame with 2460 rows and 29 variables:
#' \describe{
#'   \item{season_id}{Season in which the game was played (YYYY)}
#'   \item{team_id}{Team ID on nba.com}
#'   \item{team_abbreviation}{Team abbreviation on nba.com}
#'   \item{team_name}{Team name on nba.com}
#'   \item{game_id}{Game ID on nba.com}
#'   \item{game_date}{Date in YYYY-MM-DD}
#'   \item{matchup}{Team One vs. Team Two}
#'   \item{wl}{Win or Loss}
#'   \item{min}{Minutes in the game}
#'   \item{fgm}{Team Field goals made}
#'   \item{fga}{Team Field goal attempts}
#'   \item{fg_pct}{Team field goal percentage}
#'   \item{fg3m}{Team three point field goals made}
#'   \item{fg3a}{Team three point field goal attempts}
#'   \item{fg3_pct}{Team three point field goal percentage}
#'   \item{ftm}{Team free throws made}
#'   \item{fta}{Team free throw attempts}
#'   \item{ft_pct}{Team free throw percentage}
#'   \item{oreb}{Team offensive rebounds}
#'   \item{dreb}{Team defensive rebounds}
#'   \item{reb}{Team total rebounds}
#'   \item{ast}{Team total assists}
#'   \item{stl}{Team total steals}
#'   \item{blk}{Team total blocks}
#'   \item{tov}{Team total turnovers}
#'   \item{pf}{Team total personal fouls}
#'   \item{pts}{Team total points scored}
#'   \item{plus_minus}{Margin of game as Team score minus Opponent score}
#'   \item{video_available}{Logical if game video exists}
#' }
#' @source \url{http://asbcllc.com/nbastatR/reference/game_logs.html}
"nba_games_2023"
