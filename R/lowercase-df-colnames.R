#' Format colnames for PG (i.e. lower case and replace '.' with '_')
#' @param df input dataframe
#' @return no return
#' @export
#'
#' @examples coming soon


lowercase_df_colnames <- function(df) {
  names(df) <- tolower(names(df))
  names(df) <- gsub("\\.", "_", names(df))
  names(df) <- gsub("[^a-z0-9_]", "_", names(df))
  df
}
