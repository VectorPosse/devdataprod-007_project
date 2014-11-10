library(shiny)
library(pracma) ## To calculate Taylor polynomial for graphing
library(rSymPy) ## To print Taylor polynomials symbolically
library(stringr) ## String maniuplation

shinyServer(
    function(input, output) {
        x_min <- reactive({input$x_min})
        x_max <- reactive({input$x_max})
        n_pow <- reactive({input$n_pow})
        output$input_f <- renderUI({
            # Display LaTeX rendering of f(x)
            s <- paste("$$\\require{color} \\textcolor{blue}{f(x) = \\", input$f, "(x)}$$", sep = "")
            withMathJax(s)
        })
        output$text <- renderUI({
            f <- input$f
            # SymPy is a Python library for symbolic math 
            sympy("var('p')")
            sympy("var('x')")
            # Some finicky stuff to reformat the SymPy output
            # and make it work for LaTeX display
            sympy_text <- paste("latex(series(", f,"(x), x, 0, ", n_pow() + 1, "))")
            s <- sympy(sympy_text)
            locate <- str_locate(s, "operatorname")
            s <- substr(s, 1, locate[1] - 5)
            s <- str_replace(s, fixed("$"), "")
            s <- paste("$$\\require{color} \\textcolor{red}{T_{",
                n_pow(), "}(x) = ",  s, "}$$", sep = "")
            withMathJax(s)
        })
        output$plot <- renderPlot({
            f <- get(input$f)
            # Calculate Taylor polynomial coefficients
            p_coef <- suppressWarnings(taylor(f, 0, n_pow()))
            x <- seq(x_min(), x_max(), length.out=1000)
            y <- f(x)
            # Get Taylor polynomial as a function
            yp <- polyval(p_coef, x)
            # Plot f(x)
            plot(x, y, xlim = c(x_min(), x_max()), type = "l", col = "blue")
            # Plot Taylor polynomial
            lines(x, yp, col = "red")
        })
    }
)