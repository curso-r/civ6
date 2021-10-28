get_timeline <- function(con, gameid, stat) {
  objs <- objects_from_game(con, gameid)

  players <- tbl(con, "GamePlayers") |>
    select(PlayerObjectId, LeaderName)

  tbl(con, "DataSets") |>
    filter(
      DataSet == stat,
      ObjectId %in% objs
    ) |>
    left_join(
      y = players,
      by = c("ObjectId" = "PlayerObjectId")
    ) |>
    inner_join(tbl(con, "DataSetValues"), by = "DataSetId") |>
    collect()
}
