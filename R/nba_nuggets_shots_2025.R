#' 2015/16 - 2024/25 Shot Data for the NBA's Denver Nuggets
#'
#' A dataset containing seven seasons of Denver Nuggets shot data from NBA.com
#'
#' @format A data frame with 70488 rows and 16 variables:
#' \describe{
#'   \item{seasonId}{Season in which the game was played (YYYY-YY)}
#'   \item{gameId}{Game ID on nba.com}
#'   \item{namePlayer}{Player name}
#'   \item{nameTeam}{Full team name}
#'   \item{shotType}{Two or three point shot}
#'   \item{zoneBasic}{Description of area on court where shot was taken}
#'   \item{shotZoneArea}{More descriptive shot zone}
#'   \item{shotZoneRange}{Distance of shot in categories}
#'   \item{locationX}{X cordinate where shot was taken}
#'   \item{locationY}{Y cordinate where shot was taken}
#'   \item{shotMadeFlag}{character variable for make/miss (1/0) of shot}
#'   \item{htm}{Home Team abbreviation}
#'   \item{vtm}{Visiting Team abbreviation}
#'   \item{isHomeGame}{logical variable for home game (T/F)}
#'   \item{opponentName}{Team name of opponent}
#'   \item{isShotMade}{logical variable for make/miss (T/F) of shot}
#' }
#' @source \url{http://stats.nba.com}
"nba_nuggets_shots_2025"
