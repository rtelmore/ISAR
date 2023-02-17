#' 2022 NWSL Player Statistics
#'
#' A dataset containing individual player statistics for the National Women's Soccer League
#'
#' @format A data frame with 314 rows and 13 variables:
#' \describe{
#'   \item{player}{Player name}
#'   \item{nation}{Player home country}
#'   \item{pos}{Player position}
#'   \item{squad}{Player team}
#'   \item{age}{Age of player}
#'   \item{mp}{Matches played}
#'   \item{starts}{Number of matches in which player started the game}
#'   \item{min}{Total minutes played in the season}
#'   \item{xGp90}{Expected goals per ninety minutes}
#'   \item{xAp90}{Expected assists per ninety minutes}
#'   \item{xGxAp90}{Expected goals plus assists per ninety minutes}
#'   \item{npxGp90}{Expected goals minus penalty goals per ninety minutes}
#'   \item{npxGxAp90}{Expected goals plus assists minus penalty goals per ninety minutes}
#' }
#' @source \url{https://fbref.com/en/comps/182/stats/NWSL-Stats}
"nwsl_player_stats"
