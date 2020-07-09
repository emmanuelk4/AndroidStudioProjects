package com.example.tiles

import android.graphics.drawable.Drawable

data class TileData(
    private var speed: Float = 40f,
    var isVisible: Boolean = true,
    var tilePosition: tilePosition
)

{

    companion object{
        //tile represented by drawable
        var bitmap1: Drawable?= null
        //keep track of active instances
        var numberOfTiles = 0
    }
    init {

    }
}
enum class tilePosition {left, middle1, middle2, right}
