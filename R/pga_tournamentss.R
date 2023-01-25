#' PGA Tournament Data
#'
#' A dataset containing PGA Tournament Data from 2022 season
#'
#' @format A data frame with 3676 rows and 34 variables:
#' \describe{
#'   \item{Player_initial_last}{initial of first name and complete last name of player}
#'   \item{tournament.id}{tournament ID}
#'   \item{player.id}{plyaer ID}
#'   \item{hole_par}{par across all holes played by the player}
#'   \item{strokes}{strokes taken on all holes played by the player}
#'   \item{hole_DKP}{Draftkings points on holes}
#'   \item{hole_FDP}{Fanduel points on the holes}
#'   \item{hole_SDP}{Showdown points on the holes}
#'   \item{streak_DKP}{Draftkings points on streaks}
#'   \item{streak_FDP}{Fanduel points on streaks}
#'   \item{streak_SDP}{Showdown points on streaks}
#'   \item{n_rounds}{number of rounds played}
#'   \item{made_cut}{player made the cut or not}
#'   \item{pos}{finishing position of player}
#'   \item{finish_DKP}{Draftkings points on the finishing position}
#'   \item{finish_FDP}{Fanduel points on the finishing position}
#'   \item{finish_SDP}{Showdown points on the finishing position}
#'   \item{total_DKP}{total Draftkings points for the tournament}
#'   \item{total_FDP}{total Fanduel points for the tournament}
#'   \item{total_SDP}{total Showdown points for the tournament}
#'   \item{player}{player full name}
#'   \item{tournament.name}{tournament full name}
#'   \item{course}{course name}
#'   \item{date}{data of tournament}
#'   \item{purse}{total prize money (in millions)}
#'   \item{season}{year of season}
#'   \item{no_cut}{Not sure}
#'   \item{Finish}{finishing position}
#'   \item{sg_putt}{strokes gained from putting}
#'   \item{sg_arg}{strokes gained around the green}
#'   \item{sg_app}{strokes gained on approach shots}
#'   \item{sg_ott}{strokes gained off the tee}
#'   \item{sg_t2g}{strokes gained tee to green}
#'   \item{sg_total}{total strokes gained}
#' }
#' @source Courtesy of Matt Courchene of Datagolf.com
"pga_tournaments"
