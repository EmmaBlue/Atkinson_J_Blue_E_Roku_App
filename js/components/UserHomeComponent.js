export default {
    props: ['currentuser'],

    template: `
    <div class="container">
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
                    <li v-for="media in mediaTypes" :data-type="media.description" @click="loadMedia(null, media.description)">
                        <span>
                            <i v-bind:class="[media.iconClass]"></i>
                        </span>

                        <span class="d-none d-md-block">{{ media.description }}</span>
                    </li>
                </ul>
            </nav>

            <div class="col-12 col-sm-9 media-info">
                <!-- genres for video -->
                    <ul class="media-genres" v-if="activeMediaType == 'video'" >
                        <li>
                            <a href="1950" @click.prevent="loadMedia('1950', 'video')">1950</a>
                        </li>
                        <li>
                            <a href="1960" @click.prevent="loadMedia('1960', 'video')">1960</a>
                        </li>
                        <li>
                            <a href="1970" @click.prevent="loadMedia('1970', 'video')">1970</a>
                        </li>
                        <li>
                            <a href="1980" @click.prevent="loadMedia('1980', 'video')">1980</a>
                        </li>
                        <li>
                            <a href="1990" @click.prevent="loadMedia('1990', 'video')">1990</a>
                        </li>
                        <li>
                            <a href="all" @click.prevent="loadMedia(null, null)">All</a>
                        </li>
                    </ul>
                    <ul v-else-if="activeMediaType == 'television'" class="media-genres" >
                        <li>
                            <a href="1950" @click.prevent="loadMedia('1950', 'television')">1950</a>
                        </li>
                        <li>
                            <a href="1960" @click.prevent="loadMedia('1960', 'television')">1960</a>
                        </li>
                        <li>
                            <a href="1970" @click.prevent="loadMedia('1970', 'television')">1970</a>
                        </li>
                        <li>
                            <a href="1980" @click.prevent="loadMedia('1980', 'television')">1980</a>
                        </li>
                        <li>
                            <a href="1990" @click.prevent="loadMedia('1990', 'television')">1990</a>
                        </li>
                        <li>
                            <a href="all" @click.prevent="loadMedia(null, null)">All</a>
                        </li>
                    </ul>
                    <ul v-else class="media-genres">
                        <li>
                            <a href="1950" @click.prevent="loadMedia('1950', 'audio')">1950</a>
                        </li>
                        <li>
                            <a href="1960" @click.prevent="loadMedia('1960', 'audio')">1960</a>
                        </li>
                        <li>
                            <a href="1970" @click.prevent="loadMedia('1970', 'audio')">1970</a>
                        </li>
                        <li>
                            <a href="1980" @click.prevent="loadMedia('1980', 'audio')">1980</a>
                        </li>
                        <li>
                            <a href="1990" @click.prevent="loadMedia('1990', 'audio')">1990</a>
                        </li>
                        <li>
                            <a href="all" @click.prevent="loadMedia(null, null)">All</a>
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

        this.loadMedia(null, "video");
    },

    methods: {

        loadMedia(filter, mediaType) {
            debugger;
            // set the active media type
           // if (this.activeMediaType !== mediaType && mediaType !== null)
            if (this.activeMediaType !== mediaType && mediaType !== null) {
                this.activeMediaType = mediaType;
            }
            // build the url based on any filter we pass in (will need to expand on this for audio)

            let url = (filter == null) ? `./admin/index.php?media=${this.activeMediaType}` : `./admin/index.php?media=${mediaType}&&filter=${filter}`;

            fetch(url)
                .then(res => res.json())
                .then(data => {
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