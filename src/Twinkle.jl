module Twinkle

using Blink

using LinearAlgebra
import MeshCat
using CoordinateTransformations
using Rotations
import GeometryBasics
using Colors: RGBA, RGB
import Colors
import ColorSchemes
import FileIO
import MeshIO

using StaticArrays
import UUIDs
import Base64

include("Misc.jl")
include("Material.jl")
include("SceneObject.jl")
include("Scene.jl")


include("JSInterface/JuliaJSBridge.jl")
include("UI/UIVariables.jl")
include("UI/UIControls.jl")

include("UI/FlexUI.jl")

using ..UIControls
using ..UIVariables

        
#------------------------------------------------------------------------------
# Exports
#------------------------------------------------------------------------------
export  Scene,
        set_Y_up!,
        set_Z_up!,
        grid!,
        root, root!,
        parent, parent!,
        material, material!,
        Material,
        transform, lookAt,
        rotation,
        local_tr, local_tr!,
        cameraTransform!, cameraPlanes!,
        EmptySceneObject,
        Box,
        Mesh,
        Arrow,
        Axes,
        LineSegments,
        PointCloud,
        dataPath,
        unitX3,
        unitY3,
        unitZ3,
        zero3,
        cameraTransform!,
        url,
        clear,
        DummyExport


export  BasicValidation, on, Variable

export  Container,
        Slider,
        Button,        
        MeshCatViewer,
        Label,
        Image,
        PanZoom,
        Field,
        ButtonToggle,
        RadioGroup,
        CheckBox,
        ExpansionPanel, 
        Accordion,
        Tabs,
        Tab,
        Divider,
        Card,

        VContainer,
        HContainer,
        HContainerSpace,
        H1Label,
        H2Label,
        H3Label,
        H4Label,

        DummyExport


export FlexUI, addVariable!, prop, prop!, controls, controls!, renderFunction, renderFunction!

end # module Twinkle
