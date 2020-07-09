package com.example.tiles

import android.content.res.Resources
import android.util.Log
import androidx.lifecycle.ViewModel
import kotlinx.coroutines.withContext

class GameViewModel : ViewModel() {


    var positionTile = 0F
    lateinit var positionList: MutableList<Float>
    var it: ListIterator<Float>? = null
    var animationIndex : Int = 0



    init {
        Log.i("GameViewModel", "GameViewModel Created")
        resetPosition()
        nextValue()
    }
    fun getScreenHeight(): Float {
        return Resources.getSystem().displayMetrics.heightPixels.toFloat()
    }
    fun resetPosition() {
        positionList = mutableListOf(
            100F,
            200F,
            300F,
            400F,
            500F,
            400F,
            300F,
            200F,
            100F
        )
            positionList.random()
    }
     fun nextValue() {
         it = positionList.listIterator()
//         if (animationIndex >= positionList.size){
//             Log.d("Repeating value", (positionTile).toString())
//
//         } else if (animationIndex < positionList.size){
//             positionTile = positionList.get(animationIndex)
//             Log.d("PostionTIle value", (positionTile).toString())
//         }


     }

    override fun onCleared() {
        super.onCleared()
        Log.i("GameViewModel", "GameViewModel Created")
1
    }
}