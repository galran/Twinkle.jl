module Example

using Twinkle, Twinkle.FlexUI
using Colors
using StaticArrays
using GeometryBasics
import Makie

println("Start [$(splitext(basename(@__FILE__))[1])]")

app = App()
prop!(app, :title, "Twinkle Example - Controls Gallery")


#---------------------------------------------------------------
# Define Variables
#---------------------------------------------------------------

xscale = addVariable!(app, Variable(name="xscale", type="flota64",value=1))
yscale = addVariable!(app, Variable(name="yscale", type="flota64",value=1))

image = addVariable!(app, Variable(
    name="image",
    type="image",
    value="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAHElEQVQI12P4//8/w38GIAXDIBKE0DHxgljNBAAO9TXL0Y4OHwAAAABJRU5ErkJggg==", 
))

#---------------------------------------------------------------
# Define Controls
#---------------------------------------------------------------

ui = VContainer(
    H1Label("Value Controls"),
    Slider(
        text="X Scale [1-10]",
        trailing_text="[\$()]",
        min=1,
        max=10,
        value=1,
        variable="xscale"
    ),  
    Slider(
        text="Y Scale [1-10]",
        trailing_text="[\$()]",
        min=1,
        max=10,
        value=1,
        variable="yscale"
    ),  
    H1Label("Static Image Example"),
    Image(
        variable="image",
        height="50%",
    ),        
    H1Label("Image Viewer allowing Pan (left-drag) and Zoom (wheel)"),
    PanZoom(
        width="100%",
        height="400px",
        content = Container(
            direction = "row warp",
            children = [
                Image(
                    variable="image",
                    width="100%"
                ),        
            ]
        ),
    ),        

)
FlexUI.controls!(app, ui)


#---------------------------------------------------------------
# the render function
#---------------------------------------------------------------
function render()
    Makie.inline!(true);
    
    f = Makie.Figure()
    Makie.Axis(f[1, 1])
    
    xs = LinRange(0, 10, 100)
    ys = LinRange(0, 15, 100)
    zs = [cos(xscale[]*x) * sin(yscale[]*y) for x in xs, y in ys]
    
    Makie.contour!(xs, ys, zs)
    
    # Makie.display(f)
    image["png"] = f;

end
renderFunction!(app, render)


#---------------------------------------------------------------
# Run the application
#---------------------------------------------------------------
# render()
run(app)



println("End [$(splitext(basename(@__FILE__))[1])]")

end # module