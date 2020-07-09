package com.murage.instabrand

import android.content.Context
import android.util.AttributeSet
import android.view.MotionEvent
import androidx.viewpager.widget.ViewPager

internal class NonSwipeableViewPager : ViewPager {
    private var swipeEnabled = false
    constructor(context: Context) : super(context)
    constructor(context: Context, attrs: AttributeSet) : super(context, attrs)

    override fun onTouchEvent(ev: MotionEvent?): Boolean {
        return when (swipeEnabled){
        true -> super.onTouchEvent(ev)
            false -> false
        }
    }

    override fun onInterceptTouchEvent(ev: MotionEvent?): Boolean {
        return when (swipeEnabled) {
            true -> super.onInterceptTouchEvent(ev)
            false -> false
        }
    }
    fun setSwipePagingEnabled(swipeEnabled : Boolean) {
        this.swipeEnabled = swipeEnabled
    }
}