## Ryan Elmore
## 28 April 2021
## Getting all box scores from NBA API
## Update: 18 July 2024

library(hoopR)
library(dplyr)
library(janitor)

games <- hoopR::nba_leaguegamelog(season = "2023-24",
                                  season_type = "Regular Season")

game_ids <- sort(unique(as.numeric(games$LeagueGameLog$GAME_ID)))

df <- dplyr::as_tibble(games$LeagueGameLog) |>
  janitor::clean_names()
saveRDS(df, "tmp/nba-games-end-2024.rds")

games <- readRDS("tmp/nba-games-end-2024.rds")


## Get stats
cat(sprintf("---- Four Factors at %s \n", Sys.time()))

results <- vector("list", 600)

for(i in 1:600){
  if(i %% 20 == 0){
    cat(sprintf("Game id %s at %s \n", i, Sys.time()))
  }
  results[[i]] <- nba_boxscorefourfactorsv2(game_ids[i])
  # if(i %% 600 == 0){
  #   Sys.sleep(3605)
  # }
}

saveRDS(results, "tmp/four-factors-box-600-2024.rds")

results <- vector("list", 600)

for(i in 601:1200){
  if(i %% 50 == 0){
    cat(sprintf("Game id %s at %s \n", i, Sys.time()))
  }
  results[[i-600]] <- nba_boxscorefourfactorsv2(game_ids[i])
}

saveRDS(results, "tmp/four-factors-box-601-1200-2024.rds")

results <- vector("list", 30)

for(i in 1201:1230){
  if(i %% 20 == 0){
    cat(sprintf("Game id %s at %s \n", i, Sys.time()))
  }
  results[[i-1200]] <- nba_boxscorefourfactorsv2(game_ids[i])
}

saveRDS(results, "tmp/four-factors-box-1201-1230-2024.rds")

cat(sprintf("---- Advanced at %s \n", Sys.time()))

results <- vector("list", 600)

for(i in 1:600){
  if(i %% 50 == 0){
    cat(sprintf("Game id %s at %s \n", i, Sys.time()))
  }
  results[[i]] <- nba_boxscoreadvancedv2(game_ids[i])
}

saveRDS(results, "tmp/advanced-box-600-2024.rds")

results <- vector("list", 600)

for(i in 601:1200){
  if(i %% 50 == 0){
    cat(sprintf("Game id %s at %s \n", i, Sys.time()))
  }
  try(results[[i-600]] <- nba_boxscoreadvancedv2(game_ids[i]))
}

saveRDS(results, "tmp/advanced-box-601-1200-2024.rds")

results <- vector("list", 30)

for(i in 1201:1230){
  if(i %% 20 == 0){
    cat(sprintf("Game id %s at %s \n", i, Sys.time()))
  }
  try(results[[i-1200]] <- nba_boxscoreadvancedv2(game_ids[i]))
}

saveRDS(results, "tmp/advanced-box-1201-1230-2024.rds")

## Here
index <- which(sapply(results, is.null))
for(i in index) {
  if(i %% 20 == 0){
    cat(sprintf("Game id %s at %s \n", i, Sys.time()))
  }
  try(results[[i]] <- nba_boxscoreadvancedv2(game_ids[i + 600]))
}

cat(sprintf("---- Misc at %s \n", Sys.time()))

results <- vector("list", 600)

for(i in 1:600){
  if(i %% 50 == 0){
    cat(sprintf("Game id %s at %s \n", i, Sys.time()))
  }
  try(results[[i]] <- nba_boxscoremiscv2(game_ids[i]))
}

saveRDS(results, "tmp/misc-box-600-2024.rds")

results <- vector("list", 600)

for(i in 601:1200){
  if(i %% 50 == 0){
    cat(sprintf("Game id %s at %s \n", i, Sys.time()))
  }
  try(results[[i-600]] <- nba_boxscoremiscv2(game_ids[i]))
}

saveRDS(results, "tmp/misc-box-601-1200-2024.rds")

results <- vector("list", 30)

for(i in 1201:1230){
  if(i %% 20 == 0){
    cat(sprintf("Game id %s at %s \n", i, Sys.time()))
  }
  try(results[[i-1200]] <- nba_boxscoremiscv2(game_ids[i]))
}

saveRDS(results, "tmp/misc-box-1201-1230-2024.rds")


misc_list <- c(readRDS("tmp/misc-box-600-2024.rds"),
               readRDS("tmp/misc-box-601-1200-2024.rds"),
               readRDS("tmp/misc-box-1201-1230-2024.rds"))
saveRDS(misc_list, "tmp/misc-box-2024.rds")

adv_list <- c(readRDS("tmp/advanced-box-600-2024.rds"),
              readRDS("tmp/advanced-box-601-1200-2024.rds"),
              readRDS("tmp/advanced-box-1201-1230-2024.rds"))
saveRDS(adv_list, "tmp/adv-box-2024.rds")

ff_list <- c(readRDS("tmp/four-factors-box-600-2024.rds"),
             readRDS("tmp/four-factors-box-601-1200-2024.rds"),
             readRDS("tmp/four-factors-box-1201-1230-2024.rds"))
saveRDS(ff_list, "tmp/ff-box-2024.rds")

df_tmp <- readRDS("tmp/ff-box-2024.rds")

df <- do.call(rbind,
              lapply(df_tmp, FUN = function(x) x$sqlTeamsFourFactors)) %>%
  janitor::clean_names()

saveRDS(df, "tmp/ff-team-2024.rds")

df_tmp <- readRDS("tmp/adv-box-2024.rds")

df <- do.call(rbind,
              lapply(df_tmp, FUN = function(x) x$TeamStats)) %>%
  janitor::clean_names()

saveRDS(df, "tmp/adv-team-2024.rds")

df_tmp <- readRDS("tmp/misc-box-2025.rds")

df <- do.call(rbind,
              lapply(df_tmp, FUN = function(x) x$sqlTeamsMisc)) %>%
  janitor::clean_names()

saveRDS(df, "tmp/misc-team-2024.rds")

### Old

library(nbastatR)
library(dplyr)
library(rlang)

games <- nbastatR::game_logs(seasons = 2024,
                             league = "NBA",
                             result_types = "team")

saveRDS(games, "data/nba-games-end-2024.rds")

game_ids <- unique(games$idGame)
results <- vector("list", length(game_ids))

for(i in 1:length(results)){
  if(i %% 20 == 0){
    cat(sprintf("Game id %s at %s \n", i, Sys.time()))
  }
  results[[i]] <- suppressMessages(nbastatR::box_scores(game_ids = game_ids[i],
                                                       box_score_types = "Four Factors",
                                                       result_types = "team"))
  if(i %% 400 == 0){
    Sys.sleep(905)
  }
}


rm(ff)
for(i in seq_along(results)){
  print(i)
  if(exists("ff")) {
    ff <- rbind(ff, results[[i]]$dataBoxScore[[1]])
  } else {
    ff <- results[[i]]$dataBoxScore[[1]]
  }
}

saveRDS(ff, "data/four-factors-team-end-2024.rds")


game_ids <- unique(games$idGame)
results <- vector("list", length(game_ids))

for(i in seq_along(results)){
  if(i %% 50 == 0){
    cat(sprintf("Game id %s at %s \n", i, Sys.time()))
  }
  results[[i]] <- suppressMessages(box_scores(game_ids = game_ids[i],
                                              box_score_types = "Advanced",
                                              result_types = "team"))
  if(exists("adv")) {
    adv <- rbind(adv, results[[i]]$dataBoxScore[[1]])
  } else {
    adv <- results[[i]]$dataBoxScore[[1]]
  }
  if(i %% 400 == 0){
    Sys.sleep(1800)
  }
}

#adv_2 <- distinct(adv)
saveRDS(adv, file = "data/advanced-team-end-2024.rds")

for(i in seq_along(results)){
  if(i %% 50 == 0){
    cat(sprintf("Game id %s at %s \n", i, Sys.time()))
  }
  results[[i]] <- suppressMessages(box_scores(game_ids = game_ids[i],
                                              box_score_types = "Misc",
                                              result_types = "team"))
  if(exists("misc")) {
    misc <- rbind(misc, results[[i]]$dataBoxScore[[1]])
  } else {
    misc <- results[[i]]$dataBoxScore[[1]]
  }
  if(i %% 400 == 0){
    Sys.sleep(1805)
  }
}

saveRDS(adv, file = "data/misc-team-end-2024.rds")

# metrics <- c("Traditional", "Advanced", "Scoring", "Misc", "Usage",
#              "hustle", "tracking")
#
# results <- vector("list", length(game_ids))
#
# for(j in seq_along(metrics)){
#
#   for(i in 1:length(results)){
#     if(i %% 10 == 0){
#       cat(sprintf("Game id %s at %s \n\n", i, Sys.time()))
#     }
#     results[[i]] <- suppressMessages(box_scores(game_ids = game_ids[i],
#                                                 box_score_types = metrics[j],
#                                                 result_types = "team"))
#     if(i %% 100 == 0){
#       Sys.sleep(600)
#     }
#   }
#   saveRDS(results, file = paste("data/", metrics[j], "-team.rds", sep = ""))
# }
#
# saveRDS(games, )

df_a <- readRDS("data/advanced-team-end-2024.rds")
df_g <- readRDS("data/nba-games-end-2024.rds")
df_ff <- readRDS("data/four-factors-team-end-2024.rds")

df_g_sub <- df_g %>%
  dplyr::filter(., !(idGame %in% df_a$idGame))
df_a$idGame %!in% df_g$idGame

game_ids <- unique(df_g_sub$idGame)
results <- vector("list", length(game_ids))

for(i in seq_along(results)){
    cat(sprintf("Game id %s at %s \n", i, Sys.time()))
  results[[i]] <- suppressMessages(box_scores(game_ids = game_ids[i],
                                              box_score_types = "Advanced",
                                              result_types = "team"))
  if(exists("adv")) {
    adv <- rbind(adv, results[[i]]$dataBoxScore[[1]])
  } else {
    adv <- results[[i]]$dataBoxScore[[1]]
  }
  if(i %% 400 == 0){
    Sys.sleep(1800)
  }
}

df_adv <- dplyr::bind_rows(df_a, adv)
saveRDS(df_adv, "data/advanced-team-end-2021.rds")

## Nuggets Shots
nbastatR::teams_shots(teams = "Denver Nuggets", seasons = 2021)

df <- dplyr::bind_rows(
  nbastatR::teams_shots(teams = "Denver Nuggets", seasons = 2022),
  nbastatR::teams_shots(teams = "Denver Nuggets", seasons = 2024))

df <- dplyr::bind_rows(
  readRDS("~/research/isar-code/data/nuggets-2015-21.rds"),
  nbastatR::teams_shots(teams = "Denver Nuggets", seasons = 2022),
  nbastatR::teams_shots(teams = "Denver Nuggets", seasons = 2024))

saveRDS(df, "tmp/nuggets-2015-23.rds")
