#' Check for MULTISURFACE geometry in a File Geodatabase.
#'
#' Reads a sample of features from a File Geodatabase layer and checks whether
#' any features have `MULTISURFACE` geometry.
#'
#' @param gdb_path Character. The full file path to the File Geodatabase (.gdb).
#' @param layer_name Character. The name of the feature class (layer) within
#'   the geodatabase to check.
#' @param nrow Integer. The maximum number of features to read and check.
#'   Defaults to 1000.
#'
#' @return Logical. Returns `TRUE` if `MULTISURFACE` geometry is detected;
#'   otherwise returns `FALSE`.
#'
#' @export
#'
#' @examples
#' in_gdb <- "E:/data/indata.gdb"
#' in_fc  <- "parks"
#'
#' check_geom <- check_multisurface_gdb(
#'   gdb_path = in_gdb,
#'   layer_name = in_fc,
#'   nrow = 1000
#' )
#'
#' if (!check_geom) {
#'   message(glue::glue("No MULTISURFACE geometry found in {in_gdb}/{in_fc}"))
#' } else {
#'   warning(glue::glue(
#'     "MULTISURFACE geometry detected in {in_gdb}/{in_fc}. ",
#'     "Data may not import correctly."
#'   ))
#' }
check_multisurface_gdb <- function(gdb_path, layer_name, nrow = 1000) {

  result <- st_read(
    dsn = gdb_path,
    layer = layer_name,
    quiet = TRUE,
    n_max = nrow
  )

  any(st_geometry_type(result) == "MULTISURFACE")
}
