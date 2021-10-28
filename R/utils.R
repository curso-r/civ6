objects_from_game <- function(con, gameid) {
  tbl(con, "GameObjects") |>
    filter(GameId == gameid, Type == "Player") |>
    pull(ObjectId)
}

