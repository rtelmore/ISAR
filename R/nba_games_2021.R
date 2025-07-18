#' 2021 NBA Game Logs for the 2020-21 Season
#'
#' A dataset containing the NBA Games table on nba.com
#'
#' @format A data frame with 1832 rows and 47 variables:
#' \describe{
#'   \item{yearSeason}{Season in which the game was played (YYYY)}
#'   \item{slugSeason}{Season in which the game was played (YYYY-YY)}
#'   \item{slugLeague}{Always given as NBA}
#'   \item{typeSeason}{Regular season data}
#'   \item{dateGame}{Date in YYYY-MM-DD}
#'   \item{idGame}{Game ID on nba.com}
#'   \item{numberGameTeamSeason}{slugTeam game number in the season}
#'   \item{nameTeam}{Full team name}
#'   \item{idTeam}{Team ID on nba.com}
#'   \item{isB2B}{Logical for back-to-back game}
#'   \item{isB2BFirst}{Logical for first game of back-to-back game}
#'   \item{isB2BSecond}{Logical for second game of back-to-back game}
#'   \item{locationGame}{Home (H) or Away (A)}
#'   \item{slugMatchup}{Team One vs. Team Two}
#'   \item{slugTeam}{Team abbreviation}
#'   \item{countDaysRestTeam}{Days between previous game and this game}
#'   \item{countDaysNextGameTeam}{Days until next game}
#'   \item{slugOpponent}{Opponent abbreviation}
#'   \item{slugTeamWinner}{Team that won (abbreviation)}
#'   \item{slugTeamLoser}{Team that lost (abbreviation)}
#'   \item{outcomeGame}{Result for slugTeam (W or L)}
#'   \item{isWin}{Logical for slugTeam winning}
#'   \item{fgmTeam}{slugTeam field goals made}
#'   \item{fgaTeam}{slugTeam field goal attempts}
#'   \item{pctFGTeam}{slugTeam field goal percentage}
#'   \item{fg3mTeam}{slugTeam three point field goals made}
#'   \item{fg3aTeam}{slugTeam three point field goal attempts}
#'   \item{pctFG3Team}{slugTeam three point field goal percentage}
#'   \item{pctFTTeam}{slugTeam free throw percentage}
#'   \item{hasVideo}{Logical if game video exists}
#'   \item{fg2mTeam}{slugTeam two point field goals made}
#'   \item{fg2aTeam}{slugTeam two point field goal attempts}
#'   \item{pctFG2Team}{slugTeam two point field goal percentage}
#'   \item{minutesTeam}{Total minutes played}
#'   \item{ftmTeam}{slugTeam free throws made}
#'   \item{ftaTeam}{slugTeam free throw attempts}
#'   \item{orebTeam}{slugTeam offensive rebounds}
#'   \item{drebTeam}{slugTeam defensive rebounds}
#'   \item{trebTeam}{slugTeam total rebounds}
#'   \item{astTeam}{slugTeam total assists}
#'   \item{stlTeam}{slugTeam total steals}
#'   \item{blkTeam}{slugTeam total blocks}
#'   \item{tovTeam}{slugTeam total turnovers}
#'   \item{pfTeam}{slugTeam total personal fouls}
#'   \item{ptsTeam}{slugTeam total points scored}
#'   \item{plusminusTeam}{Margin of game as slugTeam score minus slugOpponent score}
#'   \item{urlTeamSeasonLogo}{url of slugTeam logo}
#' }
#' @source \url{http://asbcllc.com/nbastatR/reference/game_logs.html}
"nba_games_2021"
