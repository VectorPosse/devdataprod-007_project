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
        withMathJax(helpText(
             "Taylor polynomials are polynomials that best 
            approximate a function near a point. (This app uses polynomials 
            centered at zero.)")),
        withMathJax(helpText(
            "Choose a function \\(f(x)\\). Play with the value of \\(n\\) to
            increase or decrease the power of the polynomial.
            Some features of the approximation are easier to see if you change 
            the range on the \\(x\\)-axis.")),
        withMathJax(helpText(
            "(If you don't see the plot right away, especially the first time 
            you load the app, just be patient. There are several Javascript 
            libraries that have to load.)")),
        uiOutput("input_f"),
        uiOutput("text"),
        plotOutput("plot")
    )
))