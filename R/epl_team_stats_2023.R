#' 2022-23 English Premier League Team Statistics
#'
#' A dataset containing team statistics for the English Premier League 2022-23
#'
#' @format A data frame with 20 rows and 31 variables:
#' \describe{
#'   \item{season_end_year}{Calendar year when season ended}
#'   \item{squad}{Player team}
#'   \item{comp}{League (Premier League)}
#'   \item{num_players}{Number of players used in the season}
#'   \item{age}{Age of players weighted by minutes played}
#'   \item{poss}{Possession as a percentage of passes attempted}
#'   \item{goals}{Goals scored by team}
#'   \item{assists}{Assists by team}
#'   \item{goals_assists}{Goals scored plus assists by team}
#'   \item{non_pen_goals}{Non-penalty goals scored by team}
#'   \item{pen_goals}{Penalty kick goals scored by team}
#'   \item{pen_att}{Penalty kick attempts by team}
#'   \item{yellow_cards}{Yellow cards earned by team}
#'   \item{red_cards}{Red cards earned by team}
#'   \item{xG}{Expected goals}
#'   \item{non_pen_xG}{Non-penalty kick expected goals}
#'   \item{xA}{Expected assists}
#'   \item{non_pen_xGxA}{Non-penalty kick expected goals and assists}
#'   \item{prg_carry}{Progressive carries}
#'   \item{prg_pass}{Progressive passes}
#'   \item{goals_p90}{Goals per ninety minutes}
#'   \item{assists_p90}{Assists per ninety minutes}
#'   \item{goals_assists_p90}{Goals and assists per ninety minutes}
#'   \item{non_pen_goals_p90}{Non-penalty kick goals per ninety minutes}
#'   \item{non_pen_goals_assists_p90}{Non-penalty kick goals and assists per ninety minutes}
#'   \item{xG_p90}{Expected goals per ninety minutes}
#'   \item{xA_p90}{Expected assists per ninety minutes}
#'   \item{xG_xA_p90}{Expected goals plus assists per ninety minutes}
#'   \item{non_pen_xG_p90}{Expected goals minus penalty goals per ninety minutes}
#'   \item{non_pen_xG_xA_p90}{Expected goals plus assists minus penalty goals per ninety minutes}
#'   \item{url}{URL of player stats on fbref.com}
#' }
#'
#' @source From fbref.com via the worldfootballR package
"epl_team_stats_2023"
