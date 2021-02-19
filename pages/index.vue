<template>
  <full-page id="fullpage" ref="fullpage" :options="options">
    <div class="section section--one">
      <div class="section__bg section__bg--one"></div>
      <div class="section__content section__content--one">
        <img
          src="~/assets/icon/married.svg"
          alt="married icon"
          class="icon icon--married"
        />
        <h1>ขอเรียนเชิญเป็นเกียรติในพิธีหมั้น</h1>
        <h2>ระหว่าง</h2>
        <h2>นางสาวกนกทิพย์ ตะเคียนศก</h2>
        <img
          src="~/assets/icon/wedding-ring.svg"
          alt="wedding ring icon"
          class="icon icon--wedding-ring"
        />
        <h2>นายภาณุพงศ์ เหลืองปทุม</h2>
      </div>
    </div>
    <div class="section section--two">
      <div class="section__bg section__bg--two"></div>
      <div class="section__content section__content--two">
        <h1>ณ วันที่</h1>
        <h1>21/02/2021</h1>
      </div>
    </div>
    <div class="section section--location">
      <div class="section__bg section__bg--location"></div>
      <div class="section__content section__content--location">
        <static-map
          :google-api-key="map.apiKey"
          :format="map.format"
          :markers="map.markers"
          :zoom="map.zoom"
          :center="map.center"
          :size="map.size"
          :type="map.type"
          :language="map.language"
        ></static-map>
        <h1>สถานที่</h1>
      </div>
    </div>
    <div class="section section--schedule">
      <div class="section__bg section__bg--schedule"></div>
      <div class="section__content section__content--schedule">
        <img
          src="~/assets/icon/bowl.svg"
          alt="bowl icon"
          class="icon icon--bowl"
        />
        <h1>07:00 : ใส่บาตรเช้า</h1>

        <img
          src="~/assets/icon/banquet.svg"
          alt="banquet icon"
          class="icon icon--banquet"
        />
        <h1>07:00 : ใส่บาตรเช้า</h1>

        <img
          src="~/assets/icon/table-etiquette.svg"
          alt="table etiquette icon"
          class="icon icon--table-etiquette"
        />
        <h1>07:00 : ใส่บาตรเช้า</h1>
      </div>
    </div>
    <div class="section section--credit">
      <div class="section__bg section__bg--credit"></div>
      <div class="section__content section__content--credit">
        <h1>ขอขอบคุณ</h1>
      </div>
    </div>
  </full-page>
</template>

<script>
import StaticMap from 'vue-static-map';

export default {
  components: {
    StaticMap,
  },

  data() {
    return {
      options: {
        menu: '#menu',
        anchors: ['home', 'date', 'location', 'schedule'],
        scrollOverflow: false,
        controlArrows: true,
        scrollBar: true,
      },

      map: {
        apiKey: process.env.MAP_API_KEY, // required
        zoom: 13, // required
        center: 'Brooklyn+Bridge,New+York,NY',
        format: 'gif',
        language: 'th',
        markers: [
          {
            label: 'B',
            color: 'blue',
            lat: 40.702147,
            lng: -74.015794,
            size: 'normal',
          },
        ],
        type: 'roadmap',
        size: [800, 400],
      },
    };
  },
  methods: {},
};
</script>

<style lang="scss">
@import 'https://fonts.googleapis.com/css2?family=Kanit:wght@300&display=swap';

body,
html {
  font-family: 'Kanit', sans-serif;
  padding: 0;
  margin: 0;
}

.fp-scroller {
  min-height: 100vh;
}

.section {
  padding: 20px;
  position: relative;
  overflow: hidden;

  &--one {
  }

  &__bg {
    background-repeat: no-repeat;
    background-position: center center;
    background-size: cover;

    //filter: blur(2px);
    position: absolute;
    top: -10px;
    left: -10px;
    right: -10px;
    bottom: -10px;
    z-index: 1;

    &--one {
      background-image: url('~/assets/background/page-1.jpg');
    }

    &--two {
      background-image: url('~/assets/background/page-2.jpg');
    }

    &--schedule {
      background-image: url('~/assets/background/page-3.jpg');
      background-position: center bottom;
    }
  }

  &__content {
    position: relative;
    z-index: 2;

    display: flex;
    flex-direction: column;
    height: 100%;
    align-items: center;
    justify-content: center;
  }
}

.icon {
  width: 32px;
  height: 32px;

  &--married {
    width: 64px;
    height: 64px;
  }

  &--wedding-ring {
    width: 32px;
    height: 32px;
  }
}
</style>
