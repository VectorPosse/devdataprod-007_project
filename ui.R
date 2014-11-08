library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("Taylor Polynomials"),
    sidebarPanel(
        h3("Function and parameters"),
        selectInput("f", "Function:",
                    choices = c("sin(x)" = "sin", "cos(x)" = "cos", "exp(x)" = "exp")),
        sliderInput("n", "\\(n\\) (power of polynomial)",
                    min = 0, max = 10, value = 1, step = 1)
    ),
    mainPanel(
        withMathJax(h3("Plot of \\(f(x)\\) and \\(T(x)\\)")),
        textOutput("text")
    )
))