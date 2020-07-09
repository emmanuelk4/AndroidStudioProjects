package com.example.spotify

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import com.spotify.android.appremote.api.ConnectionParams;
import com.spotify.android.appremote.api.Connector;
import com.spotify.android.appremote.api.SpotifyAppRemote;

import com.spotify.protocol.client.Subscription;
import com.spotify.protocol.types.PlayerState;
import com.spotify.protocol.types.Track;


class MainActivity : AppCompatActivity() {
    private val clientID = "99d5bdd761fe4c3398a379e2d2261236";
    val redirectUri = "https://com.example.spotify/callback";
    lateinit var spotifyAppRemote : SpotifyAppRemote;

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }

    override fun onStart() {
        super.onStart();
        val connectionParams = ConnectionParams.Builder(clientID)
                .setRedirectUri(redirectUri)
                .showAuthView(true)
                .build();

        SpotifyAppRemote.connect(this, connectionParams, object :
        Connector.ConnectionListener {
            override fun onConnected(appRemote: SpotifyAppRemote) {
                spotifyAppRemote = appRemote;
                Log.d("MainActivity", "Connected");
                connected();
            }

            override fun onFailure(throwable: Throwable) {
            Log.e("MainActivity", throwable.message, throwable);
            }
        })
    }

    private fun connected(){
        spotifyAppRemote.playerApi.play("spotify:playlist:37i9dQZF1DX2sUQwD7tbmL")
    }

    override fun onStop() {
        super.onStop()
    }
}