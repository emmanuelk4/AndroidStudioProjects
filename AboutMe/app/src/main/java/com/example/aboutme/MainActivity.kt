package com.example.aboutme

import android.databinding.DataBindingUtil
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import com.example.aboutme.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {
    private lateinit var binding: ActivityMainBinding;
    private val myName: MyName = MyName("Murage Kibicho");
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = DataBindingUtil.setContentView(this,R.layout.activity_main);
        binding.bioScroll.setOnClickListener{
            binding.myName = myName;
            binding.apply {
                invalidateAll();
            }

        }

    }
}

