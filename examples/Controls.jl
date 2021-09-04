module TwinkleExample

using Twinkle, Twinkle.FlexUI
using Colors
using StaticArrays

println("Start [$(splitext(basename(@__FILE__))[1])]")

#---------------------------------------------------------------
# Create the Application Object and the 3D viewer 
#---------------------------------------------------------------
app = App()
FlexUI.prop!(app, :title, "Twinkle Example - Controls Gallery")

# scene = Scene(openWindow = false)
# set_Z_up!(scene)
# grid!(scene, false)
# cameraTransform!(scene, lookAt(SVector(0.0, 10.0, 200.0), zero3()))
# cameraPlanes!(scene, 0.1, 1000.0)

#---------------------------------------------------------------
# Define Variables
#---------------------------------------------------------------

labelText = addVariable!(app, Variable(name="labelText", type="string",value="This text comes from a variable"))
firstName = addVariable!(app, Variable(name="firstName", type="string",value=""))
height = addVariable!(app, Variable(name="height", type="flota64",value="176"))

option = addVariable!(app, Variable(name="option", type="string",value="Four"))

range1 = addVariable!(app, Variable(name="range1", type="flota64",value=0))
range2 = addVariable!(app, Variable(name="range2", type="flota64",value=0.5))


#---------------------------------------------------------------
# Define Controls
#---------------------------------------------------------------

ui = VContainer(
    Accordion(
        panels = [
            ExpansionPanel(
                title="Label",
                summary="Examples of different labels",
                content = VContainer(
                    HContainerSpace(
                        Label(text="A Normal Label"),
                        Label(text="""Label(text="A Normal Label")"""),
                    ),
                    HContainerSpace(
                        Label(text="Label with style", style="color: red;"),
                        Label(text="""Label(text="Label with style", style="color: red;")"""),
                    ),
                    HContainerSpace(
                        Label(text="Label with style and class H1", class="h1", style="color: red;"),
                        Label(text="""Label(text="Label with style and class H1", class="h1", style="color: red;")"""),
                    ),
                    HContainerSpace(
                        Label(text="Label with style and class H2", class="h2", style="color: blue;"),
                        Label(text="""Label(text="Label with style and class H2", class="h2", style="color: blue;")"""),
                    ),
                    HContainerSpace(
                        Label(text="Label with style and class H1", class="h3", style="background-color:rgb(255, 99, 71);"),
                        Label(text="""Label(text="Label with style and class H1", class="h3", style="background-color:rgb(255, 99, 71);")"""),
                    ),
                    HContainerSpace(
                        Label(text="Label with style and class H1", class="h1", style="background-color:#ff6347;"),
                        Label(text="""Label(text="Label with style and class H1", class="h1", style="background-color:#ff6347;")"""),
                    ),
                    HContainerSpace(
                        Label(text="Allow <u>HTML</u> tags in <span style='color:red;'>text.</span>", isHTML=true),
                        Label(text="""Label(text="Allow <u>HTML</u> tags in <span style='color:red;'>text.</span>", isHTML=true)"""),
                    ),
                    Divider(),
                    HContainerSpace(
                        Label(variable="labelText", isHTML=true),
                        Container(
                            direction = "column",
                            align = "center end",
                            children = [
                                Label(text="""Label(variable="labelText", isHTML=true)"""),
                                Label(text="""You can change the content of the label using the Julia REPL:"""),
                                Label(text="""REPL: TwinkleExample.labelText[] = "This text is from Julia" """, style="color: red;" ),
                            ]
                        ),
                    ),
                ),
            ),        

            ExpansionPanel(
                title="Field",
                summary="Examples of different fields",
                content = VContainer(
                    HContainerSpace(
                        Field(
                            input="text",
                            label="First Name",
                            hint="No digits please",
                            variable="firstName",
                        ),  
                        Container(
                            direction = "column",
                            align = "center end",
                            children = [
                                Label(text="""Field(
                                    input="text",
                                    label="First Name",
                                    hint="No digits please",
                                    variable="firstName",
                                )"""),
                                Label(text="""REPL: TwinkleExample.firstName[] = "This text is from Julia" """, style="color: red;" ),
                            ]
                        ),
                    ),
                    HContainerSpace(
                        Field(
                            input="number",
                            label="Height",
                            hint="in centimeters",
                            variable="height",
                        ),  
                        Container(
                            direction = "column",
                            align = "center end",
                            children = [
                                Label(text="""Field(
                                    input="number",
                                    label="Height",
                                    hint="in centimeters",
                                    variable="height",
                                )"""),
                                Label(text="""REPL: TwinkleExample.height[] = 183.1 """, style="color: red;" ),
                            ]
                        ),
                    ),

                    HContainerSpace(
                        Field(
                            input="select",
                            label="A Simple ComboBox",
                            hint="Please select an option",
                            variable="option",
                            options = [
                                Dict(:key=>"One", :value=>"First Option"),
                                Dict(:key=>"Two", :value=>"Second Option"),
                                Dict(:key=>"Three", :value=>"Third Option"),
                                Dict(:key=>"Four", :value=>"Forth Option"),
                            ]
                        ),  
                        Container(
                            direction = "column",
                            align = "center end",
                            children = [
                                Label(text="""Field(
                                    input="select",
                                    label="A Simple ComboBox",
                                    hint="Please select an option",
                                    variable="option",
                                    options = [
                                        Dict(:key=>"One", :value=>"First Option"),
                                        Dict(:key=>"Two", :value=>"Second Option"),
                                        Dict(:key=>"Three", :value=>"Third Option"),
                                        Dict(:key=>"Four", :value=>"Forth Option"),
                                    ]
                                )"""),
                                Label(text="""REPL: TwinkleExample.option[] = "Two" """, style="color: red;" ),
                            ]
                        ),
                    ),                    
                ),
            ),

            ExpansionPanel(
                title="Slider",
                summary="Examples of different sliders",
                content = VContainer(
                    HContainerSpace(
                        Slider(
                            min=0,
                            max=100,
                            value=10,
                            variable="range1"
                        ),  
                        Container(
                            direction = "column",
                            align = "center end",
                            children = [
                                Label(text="""Slider(
                                    min=0,
                                    max=100,
                                    value=10,
                                    variable="range1"
                                )"""),
                            ]
                        ),
                    ),
                    HContainerSpace(
                        Slider(
                            text="Some Text",
                            min=0,
                            max=100,
                            value=10,
                            variable="range1"
                        ),  
                        Container(
                            direction = "column",
                            align = "center end",
                            children = [
                                Label(text="""Slider(
                                    text="Some Text",
                                    min=0,
                                    max=100,
                                    value=10,
                                    variable="range1"
                                )"""),
                            ]
                        ),
                    ),                    
                    HContainerSpace(
                        Slider(
                            text="Embedded Value [\$()]",
                            trailing_text="[\$()cm]",
                            min=0,
                            max=100,
                            value=10,
                            variable="range1"
                        ),  
                        Container(
                            direction = "column",
                            align = "center end",
                            children = [
                                Label(text="""Slider(
                                    text="Embedded Value [\$()]",
                                    trailing_text="[\$()cm]",
                                    min=0,
                                    max=100,
                                    value=10,
                                    variable="range1"
                                )"""),
                            ]
                        ),
                    ),    
                    
                    HContainerSpace(
                        Slider(
                            text="Step Size",
                            trailing_text="[\$()cm]",
                            min=0,
                            max=1,
                            value=0.5,
                            step=0.01,
                            variable="range2"
                        ),  
                        Container(
                            direction = "column",
                            align = "center end",
                            children = [
                                Label(text="""Slider(
                                    text="Step Size",
                                    trailing_text="[\$()cm]",
                                    min=0,
                                    max=1,
                                    value=0.5,
                                    step=0.01,
                                    variable="range2"
                                )"""),
                            ]
                        ),
                    ),                    
                ),
            )            
        ],
    ),

)
FlexUI.controls!(app, ui)

#---------------------------------------------------------------
# Run the application
#---------------------------------------------------------------
run(app)

println("End [$(splitext(basename(@__FILE__))[1])]")

end # module