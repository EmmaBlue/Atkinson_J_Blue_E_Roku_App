export default {
    props: ['currentuser', 'administrator'],

    template: `
    <div class="container">
        <div class="row" v-if="administrator == true">
            <p>Hello</p>
        </div>
    <!-- render this if we're viewing film -->
        <div class="row" v-if="activeMediaType == 'video' && retrievedMedia.length > 0">
            <div class="col-12 order-1 order-md-1 col-md-3 media-container">
                <h4 class="media-title">{{currentMediaDetails.movies_title}}</h4>
                <img class="img-movies" :src="'images/video/' + currentMediaDetails.movies_cover"/>
            </div>

            <div class="col-12 order-2 order-md-2 col-md-9 media-container">
                <video autoplay controls muted :src="'video/' + currentMediaDetails.movies_trailer" class="fs-video"></video>
            </div>
        </div>

    <!-- render this if we're viewing television -->

        <div class="row" v-if="activeMediaType == 'television' && retrievedMedia.length > 0">
            <div class="col-12 order-1 order-md-1 col-md-3 media-container">
                <h4 class="media-title">{{currentMediaDetails.tv_title}}</h4>
                <img class="img-tv" :src="'images/tv/' + currentMediaDetails.tv_cover"/>
            </div>

            <div class="col-12 order-2 order-md-2 col-md-9 media-container">
                <video autoplay controls muted :src="'video/tv/' + currentMediaDetails.tv_src" class="fs-video"></video>
            </div>
        </div>

    <!-- render this if we're viewing audio -->

        <div class="row main-media-container" v-if="activeMediaType == 'audio' && retrievedMedia.length > 0">
            <div class="col-12 order-2 order-md-1 col-md-6 media-container">
                <h4 class="media-title">{{currentMediaDetails.audio_title}}</h4>
                <img class="img-audio" :src="'images/audio/' + currentMediaDetails.audio_cover"/>

                <div class="col-12 order-1 order-md-2 col-md-6 audio-wrapper">
                <audio autoplay controls :src="'audio/' + currentMediaDetails.audio_src"/>
            </div>

            </div>
        </div>

        <div class="row"> <!-- 2-up for nav and media info -->
            <nav class="col-12 col-sm-3 side-nav">
                <ul class="media-type">
                    <li v-for="media in mediaTypes" :data-type="media.description" @click="loadMedia(null, media.description, permissionLevel)">
                        <span>
                            <i v-bind:class="[media.iconClass]"></i>
                        </span>

                        <span class="d-none d-md-block media-type-text">{{ media.description }}</span>
                    </li>
                </ul>
            </nav>

            <div class="col-12 col-sm-9 media-info">
                <!-- genres for video -->
                    <ul class="media-genres" v-if="activeMediaType == 'video'" >
                        <li>
                            <a href="1950" @click.prevent="loadMedia('1950', 'video',permissionLevel)">1950</a>
                        </li>
                        <li>
                            <a href="1960" @click.prevent="loadMedia('1960', 'video',permissionLevel)">1960</a>
                        </li>
                        <li>
                            <a href="1970" @click.prevent="loadMedia('1970', 'video',permissionLevel)">1970</a>
                        </li>
                        <li>
                            <a href="1980" @click.prevent="loadMedia('1980', 'video', permissionLevel)">1980</a>
                        </li>
                        <li>
                            <a href="1990" @click.prevent="loadMedia('1990', 'video', permissionLevel)">1990</a>
                        </li>
                        <li>
                            <a href="all" @click.prevent="loadMedia(null, 'video', permissionLevel )">All</a>
                        </li>
                    </ul>
                    <ul v-else-if="activeMediaType == 'television'" class="media-genres" >
                        <li>
                            <a href="1950" @click.prevent="loadMedia('1950', 'television', permissionLevel)">1950</a>
                        </li>
                        <li>
                            <a href="1960" @click.prevent="loadMedia('1960', 'television',permissionLevel)">1960</a>
                        </li>
                        <li>
                            <a href="1970" @click.prevent="loadMedia('1970', 'television',permissionLevel)">1970</a>
                        </li>
                        <li>
                            <a href="1980" @click.prevent="loadMedia('1980', 'television',permissionLevel)">1980</a>
                        </li>
                        <li>
                            <a href="1990" @click.prevent="loadMedia('1990', 'television',permissionLevel)">1990</a>
                        </li>
                        <li>
                            <a href="all" @click.prevent="loadMedia(null, 'television', permissionLevel)">All</a>
                        </li>
                    </ul>
                    <ul v-else class="media-genres">
                        <li>
                            <a href="1950" @click.prevent="loadMedia('1950', 'audio',permissionLevel)">1950</a>
                        </li>
                        <li>
                            <a href="1960" @click.prevent="loadMedia('1960', 'audio', permissionLevel)">1960</a>
                        </li>
                        <li>
                            <a href="1970" @click.prevent="loadMedia('1970', 'audio', permissionLevel)">1970</a>
                        </li>
                        <li>
                            <a href="1980" @click.prevent="loadMedia('1980', 'audio', permissionLevel)">1980</a>
                        </li>
                        <li>
                            <a href="1990" @click.prevent="loadMedia('1990', 'audio', permissionLevel)">1990</a>
                        </li>
                        <li>
                            <a href="all" @click.prevent="loadMedia(null, 'audio', permissionLevel)">All</a>
                        </li>
                    </ul>

                <div class="thumb-wrapper clearfix">
                    <img v-if="activeMediaType == 'video'" v-for="media in retrievedMedia" :src="'images/video/' + media.movies_cover" alt="media thumb" @click="switchActiveMedia(media)" class="img-thumbnail rounded float-left media-thumb">
                    <img v-if="activeMediaType == 'audio'" v-for="media in retrievedMedia" :src="'images/audio/' + media.audio_cover" alt="media thumb" @click="switchActiveMedia(media)" class="img-thumbnail rounded float-left media-thumb audio-thumb">
                    <img v-if="activeMediaType == 'television'" v-for="media in retrievedMedia" :src="'images/tv/' + media.tv_cover" alt="media thumb" @click="switchActiveMedia(media)" class="img-thumbnail rounded float-left media-thumb">
                </div>
            </div>
        </div> <!-- end 2-up for media info -->
    </div>
    `,

    data() {
        return {
            // set the default to video -> will get a random video via query on create
            activeMediaType: "video",

            // push first (or random) media object here (selected / filtered on create)
            currentMediaDetails: {
                source: "lucy.mp4",
            },

            permissionLevel: '',

            // could add more media types here in future
            mediaTypes: [
                { iconClass: "fas fa-headphones", description: "audio" },
                { iconClass: "fas fa-film", description: "video" },
                { iconClass: "fas fa-tv", description: "television" }
            ],

            retrievedMedia: [],

            // controls mute / unmute for video element
            vidActive: false,
            eraFilters: [

                {name: "1950", click: "1950"},
                {name: "1960", click: "1960"},
                {name: "1970", click: "1970"},
                {name: "1980", click: "1980"},
                {name: "1990", click: "1990"},
                {name: "All", click: "null"},
            ]
        }
    },

    created: function() {
        console.log('params:', this.$route.params);

        this.loadMedia(null, "video", 'G');
    },

    /*mounted: function() {
        console.log('params:', this.$route.params);

        this.loadMedia(null, "video");
        //console.log(this.administrator);

    },*/

    methods: {

        loadMedia(filter, mediaType, kid) {
            // set the active media type
            if (this.activeMediaType !== mediaType && mediaType !== null) {
                this.activeMediaType = mediaType;
            }

            let url;
            // build the url based on any filter we pass in (will need to expand on this for audio)

            /*let url = (filter == null) ? `./admin/index.php?media=${this.activeMediaType}` : `./admin/index.php?media=${mediaType}&&filter=${filter}`;*/

            if (filter == null && kid == null){

                url = `./admin/index.php?media=${this.activeMediaType}`
            }

            else if (filter == null) {

                url = `./admin/index.php?media=${this.activeMediaType}&&kid=${kid}`;

            }

            else if (kid == null) {

                url = `./admin/index.php?media=${mediaType}&&filter=${filter}`

            }

            else {

                url = `./admin/index.php?media=${mediaType}&&filter=${filter}&&kid=${kid}`

            }

            fetch(url)
                .then(res => res.json())
                .then(data => {
                // sort movies by user access type
                    if (localStorage.getItem("admin", data.admin) == 1) {
                        this.permissionLevel = null;
                        console.log(this.permissionLevel);
                    } else {
                        this.permissionLevel = 'G';
                        console.log(this.permissionLevel);

                    }
                    // we're gettin them all, dump it all in the media container
                    this.retrievedMedia = data;
                    // grab the first one in the list and make it active
                    this.currentMediaDetails = data[0];

                })
            .catch(function(error) {
                console.error(error);
            });
        },

        switchActiveMedia(media) {
            console.log(media);

            this.currentMediaDetails = media;
        }
    }
}