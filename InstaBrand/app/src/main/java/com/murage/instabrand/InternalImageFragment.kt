package com.murage.instabrand

import android.app.Activity
import android.content.Intent
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.ImageView
import android.widget.Toast
import androidx.fragment.app.Fragment
import com.bumptech.glide.Glide
import com.github.dhaval2404.imagepicker.ImagePicker
import com.google.android.material.floatingactionbutton.FloatingActionButton
import com.zomato.photofilters.imageprocessors.Filter
import com.zomato.photofilters.imageprocessors.subfilters.ColorOverlaySubFilter
import java.io.File


private const val GALLERY_IMAGE_REQ_CODE = 101
private const val CAMERA_IMAGE_REQ_CODE = 102

class InternalImageFragment : Fragment() {
    private var cameraFile: File? = null
    private var galleryFile: File? = null
    private var imageFilter: Filter? = null
    lateinit var bitmap: Bitmap
    lateinit var bitmapOutput: Bitmap

    var isFabOpen:Boolean = false
    lateinit var galleryButton: Button
    lateinit var imageContainer:ImageView
    lateinit var textButton: FloatingActionButton
    lateinit var filterButton: FloatingActionButton
    lateinit var openMenuButton: FloatingActionButton
    lateinit var resetButton: FloatingActionButton



    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        arguments?.let {
            System.loadLibrary("NativeImageProcessor")

        }
    }



    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        val view = inflater.inflate(R.layout.fragment_internal_image, container, false)
        galleryButton = view.findViewById(R.id.galleryButton)
        imageContainer = view.findViewById(R.id.image_view)
        textButton = view.findViewById(R.id.textButton)
        filterButton = view.findViewById(R.id.filterButton)
        openMenuButton = view.findViewById(R.id.openMenuButton)
        resetButton = view.findViewById(R.id.resetButton)




        openMenuButton.setOnClickListener{
            if (!isFabOpen) {

                showMenu()
            } else {
                closeMenu()
            }
        }
        galleryButton.setOnClickListener{
            pickGalleryImage(view)
        }

    return view
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (resultCode == Activity.RESULT_OK){
            Log.e("TAG", "Path:${ImagePicker.getFilePath(data)}")
            val file = ImagePicker.getFile(data)!!
            when(requestCode) {
                GALLERY_IMAGE_REQ_CODE -> {
                    galleryFile = file
                    context?.let {
                        Glide.with(it)
                            .load(galleryFile)
                            .into(imageContainer)
                        bitmap = BitmapFactory.decodeFile(galleryFile.toString())
                        imageFilter!!.addSubFilter(ColorOverlaySubFilter
                            (
                            100,
                            .2f,
                            .5f,
                            .0f
                        ))
                        bitmapOutput = imageFilter?.processFilter(bitmap)!!
                        imageContainer.setImageBitmap(bitmapOutput)


                    }
                }
                CAMERA_IMAGE_REQ_CODE-> {
                    cameraFile = file
                  //  imgCamera.setLocalImage(file)
                }
            }
        } else if (resultCode == ImagePicker.RESULT_ERROR) {
            Toast.makeText(context, ImagePicker.getError(data), Toast.LENGTH_SHORT).show()
        } else {
            Toast.makeText(context, "Task Cancelled", Toast.LENGTH_SHORT).show()
        }
    }

    fun pickGalleryImage(view: View) {
        ImagePicker.with(this)
            .galleryOnly()
            .galleryMimeTypes(
                mimeTypes  = arrayOf (
                    "image/png",
                    "image/jpg",
                    "image/jpeg"
                )
            )
            .maxResultSize(1080, 1080)
            .start(GALLERY_IMAGE_REQ_CODE)
    }


    fun showMenu() {
        isFabOpen = true
        textButton.show()
        filterButton.show()
        resetButton.show()

        textButton.animate().translationX(-700F)
        filterButton.animate().translationX(-500f)
        resetButton.animate().translationX(-300f)
    }
    private fun closeMenu() {
        isFabOpen = false
        textButton.animate().translationX(0F)
        filterButton.animate().translationX(0F)
        resetButton.animate().translationX(0f)
    }

}