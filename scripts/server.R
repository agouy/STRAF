# shinyServer(function(input, output) {
#     
#   getData <- reactive({
#     ### check the input: returns NULL if problem
#     ### if NULL, the function checkinputfile will print a message
#     if(is.null(input$file1)) { return(NULL) } else {
#       
#       X <- read.table(
#         input$file1$datapath,
#         header = TRUE,
#         sep = "\t",
#         colClasses = "character"
#       )
#       
#       if(class(X) != "data.frame" |
#          colnames(X)[1] != "ind" |
#          colnames(X)[2] != "pop" |
#          dim(X)[1] < 2 |
#          dim(X)[2] < 3) {
#         
#         warning("Input file error.")
#         return(NULL)
#         
#       }
#       
#       testGeno <- try(getgenind(), silent = TRUE)
# 
#       if(class(testGeno) == "try-error") {
#         warning("Input file error.")
#         return(NULL)
#       }
#       
#       if(length(unique(testGeno@pop)) > 1 & length(locNames(testGeno)) > 1) {
#         
#         testGeno3 <- try(
#           wc(
#             testGeno,
#             diploid = switch(
#               input$ploidy,
#               Diploid = TRUE,
#               Haploid = FALSE
#             )
#           ),
#           silent = TRUE
#         )
#         if(class(testGeno3) == "try-error") {
#           warning("Input file error.")
#           return(NULL)
#         }
#       }
#       return(input$file1)
#     }
#   })
# 
#   output$fileUploaded <- reactive({ return(!is.null(getData())) })
#   
#   output$checkInputFile <- renderText({
#     
#     if(is.null(input$file1)) { return("Please import a data set.") } 
#     else {
#       X <- read.table(input$file1$datapath,
#                       header = TRUE,
#                       sep = "\t",
#                       colClasses="character")
#       
#       if(class(X) != "data.frame") {
#         return("Input file is not a data frame. Please read the documentation for more information.")
#       }
#       if(colnames(X)[1] != "ind" | colnames(X)[2] != "pop") {
#         return("Input file error. Please read the documentation for more information.")
#       }
#       if(dim(X)[1] < 2) {
#         return("Input file error: incorrect number of rows. Please read the documentation for more information.")
#       }
#       if(dim(X)[2] < 3) {
#         return("Input file error: incorrect number of columns. Please read the documentation for more information.")
#       } 
#       
#       testGeno <- try(getgenind(), silent = TRUE)
#       
#       if(class(testGeno) == "try-error") {
#         return("Input file error. Wrong number of columns per locus (please check ploidy and number of digits).")
#       }
# 
#       testGeno3 <- try(
#         wc(
#           testGeno,
#           diploid = switch(
#             input$ploidy,
#             Diploid = TRUE,
#             Haploid = FALSE
#           )
#         ),
#         silent = TRUE
#       )
#       
#       if(class(testGeno3) == "try-error") {
#         return("Input file error. Wrong ploidy (please check the left tab).")
#       }
#       
#     }
#     
#   })
#   
#   outputOptions(output, 'fileUploaded', suspendWhenHidden = FALSE)
#   #makes the fileUploaded variable "more reactive"
#   
#   popnames <- reactive({
#     
#     if(is.null(input$file1)) { 
#       return("") 
#     } else {
#       X <- read.table(
#         input$file1$datapath,
#         header = TRUE,
#         sep = "\t",
#         colClasses = "character"
#       )
#       pop.names <- c("all", unique(X$pop))
#       return(pop.names)
#     }
#   })
#   
#   getgenind <- reactive({
#     inFile <- input$file1
#     if(is.null(inFile)) return(NULL)
#     df_out <- createGenind(
#       Ifile = inFile,
#       Imicrovariants = input$microvariants,
#       Incode = input$ncode,
#       Iploidy = input$ploidy
#     )
#     return(df_out)
#   })
#   
#   ploidy <- reactive({input$ploidy})
#   barplotcolor <- reactive({input$barplotcolor})
#   transparency <- reactive({input$transparency})
#   width <- reactive({input$width})
#   height <- reactive({input$height})
#   
#   data_Server("data_ns", getgenind, getData, barplotcolor, transparency, width, height,popnames)
#   for_popgen_Server("for_popgen", getgenind, popnames, ploidy)
#   pca_mds_Server("pca_mds", getgenind)
#   ref_mds_Server("ref_mds", getgenind)
#   file_conv_Server("file_conv", reactive({input$file1$datapath}), reactive({input$ploidy}))
# })
