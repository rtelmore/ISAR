#' 2021 NBA Four Factors (Team) for the 2020-21 Season
#'
#' A dataset containing the NBA Four Factor table on nba.com
#'
#' @format A data frame with 2160 rows and 11 variables:
#' \describe{
#'   \item{idGame}{Game ID on nba.com}
#'   \item{slugTeam}{Team abbreviation}
#'   \item{idTeam}{Team ID on nba.com}
#'   \item{pctEFGOpponent}{Effective field goal percentage of opponent}
#'   \item{pctTOVOpponent}{Turnover percentage of opponent}
#'   \item{pctOREBOpponent}{Offensive rebound percentage of opponent}
#'   \item{teamName}{Team Mascot}
#'   \item{cityTeam}{City of slugTeam}
#'   \item{minExact}{Total minutes played}
#'   \item{rateFTA}{Free throw rate of slugTeam}
#'   \item{rateFTAOpponent}{Free throw rate of opponent}
#' }
#' @source \url{http://asbcllc.com/nbastatR/reference/box_scores.html}
"nba_ff_team_2021"
