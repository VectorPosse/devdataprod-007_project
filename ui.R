library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("Taylor Polynomials"),
    sidebarPanel(
        h3("Function and parameters"),
        selectInput("f", "Function: \\(f(x) = \\)",
                    choices = c("sin(x)" = "sin", "cos(x)" = "cos", "exp(x)" = "exp")),
        sliderInput("n_pow", "\\(n\\) (power of polynomial):",
                    value = 3, min = 1, max = 15),
        sliderInput("x_min", "Lower bound for \\(x\\):",
                    value = -5, min = -10, max = -1),
        sliderInput("x_max", "Upper bound for \\(x\\):",
                    value = 3, min = 1, max = 10)
    ),
    mainPanel(
        withMathJax("\\(\\require{color}\\)"),
        withMathJax(h3("Plot of \\(\\textcolor{blue}{f(x)}\\) and its \\(n\\)th degree
            Taylor polynomial \\(\\textcolor{red}{T_{n}(x)}\\)")),
        uiOutput("input_f"),
        uiOutput("text"),
        plotOutput("plot")
    )
))