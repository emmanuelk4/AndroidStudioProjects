package com.example.tiles

import android.animation.Animator
import android.animation.ValueAnimator
import android.content.res.Resources
import android.nfc.Tag
import android.os.Bundle
import android.util.Log
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.view.WindowManager
import android.view.animation.LinearInterpolator
import android.widget.ImageView
import android.widget.LinearLayout
import android.widget.Toast
import androidx.core.animation.addListener
import androidx.lifecycle.ViewModelProvider
import androidx.lifecycle.ViewModelProviders
import kotlin.math.log
import kotlin.math.nextDown


class playable : Fragment() {
    //View handling logic and screen touches
    private var viewModel: GameViewModel? = null

    private var hasGameStarted: Boolean? = false
    private var updateCount: Int = 0
    lateinit var leftTile:ImageView
    lateinit var middleTile1:ImageView
    lateinit var middleTile2:ImageView
    lateinit var rightTile:ImageView
    lateinit var gameScreen:LinearLayout
    var screenHeight: Float? = null

    private var tileFloat: ArrayList<Float>()
        get() {

        }


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        arguments?.let {

        }
    }
    //
    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        val view =inflater.inflate(R.layout.fragment_playable, container, false)
        Log.i("GameFragment", "Called ViewModelProviders.of")

        viewModel = ViewModelProvider(this).get(GameViewModel::class.java)
        gameScreen = view.findViewById(R.id.game_screen)
        leftTile = view.findViewById(R.id.left_tile)
        middleTile1 = view.findViewById(R.id.middle1)
        middleTile2 = view.findViewById(R.id.middle2)
        rightTile = view.findViewById(R.id.right_tile)
        screenHeight = getScreenHeight()


        gameScreen.setOnClickListener {
            StartAnimation()
            var state = hasGameStarted.toString()
            //Log.d(activity.toString(), state)
        }



        return view;
    }

    override fun onResume() {
        super.onResume()
    }


    override fun onPause() {
        super.onPause()
    }

    private fun StartAnimation(){


        if (hasGameStarted == false) {
            onStartAnimation()
            hasGameStarted = true
        }


    }
    private fun onStartAnimation() {
        var update:Boolean = false
        val valueAnimator = ValueAnimator.ofFloat(screenHeight!!, 0f)
        valueAnimator.addUpdateListener {
            val value = it.animatedValue as Float
            var count:Int = 0

                leftTile.translationY = 100 - value
                middleTile1.translationY = 700 - value
                middleTile2.translationY = 600 - value
                update = true
            valueAnimator.addListener(object : Animator.AnimatorListener{
                override fun onAnimationRepeat(p0: Animator?) {
                        var count: Int = 0
                    if(middleTile1.translationY < getScreenHeight()){
                    count++
                    Log.d("Count", count.toString())
                    }}

                override fun onAnimationEnd(p0: Animator?) {

                }

                override fun onAnimationCancel(p0: Animator?) {
                    TODO("Not yet implemented")
                }

                override fun onAnimationStart(p0: Animator?) {

                }
            })


        }
        valueAnimator.repeatCount = ValueAnimator.INFINITE
        valueAnimator.interpolator = LinearInterpolator()
        valueAnimator.duration = 1000
        valueAnimator.start()
    }

    private fun getScreenHeight(): Float {
        return Resources.getSystem().displayMetrics.heightPixels.toFloat()
    }


}