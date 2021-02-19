<template>
  <div>
    <div id="menu" class="header-menu">
      <a href="#home" data-menuanchor="home">หน้าแรก</a>
      <a href="#date" data-menuanchor="date">วันที่จัดงาน</a>
      <a href="#location" data-menuanchor="location">สถานที่จัดงาน</a>
      <a href="#schedule" data-menuanchor="schedule">ตารางงาน</a>
    </div>

    <full-page id="fullpage" ref="fullpage" :options="options">
      <div class="section section--home">
        <div class="section__bg section__bg--home"></div>
        <div class="section__content section__content--home">
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
          <h2>21/02/2021</h2>
        </div>
      </div>
      <div class="section section--location">
        <div
          class="section__bg section__bg--location"
          :style="{ backgroundImage: `url(${mapUrl})` }"
        ></div>
        <div class="section__content section__content--location">
          <div class="location-detail">
            <div class="location-info">
              <h1>สถานที่</h1>
              <h2>บ้านเลขที่ 35/35 หมู่บ้านชลิดา</h2>
            </div>
            <a :href="mapLink" target="_blank" class="location-link">
              เปิดด้วย
              <img src="~/assets/icon/google-maps.svg" alt="google map icon" />
              Google Map
            </a>
          </div>
        </div>
      </div>
      <div class="section section--schedule">
        <div class="section__bg section__bg--schedule"></div>
        <div class="section__content section__content--schedule">
          <div class="schedule-item">
            <img
              src="~/assets/icon/bowl.svg"
              alt="bowl icon"
              class="icon icon--bowl"
            />
            <h2>07:00 น. : ใส่บาตรเช้า</h2>
          </div>

          <div class="schedule-item">
            <img
              src="~/assets/icon/banquet.svg"
              alt="banquet icon"
              class="icon icon--banquet"
            />
            <h2>08:00 น. : ตั้งขบวนขันหมาก</h2>
            <h2>09:09 น. : พิธีสวมแหวนหมั้น</h2>
          </div>

          <div class="schedule-item">
            <img
              src="~/assets/icon/table-etiquette.svg"
              alt="table etiquette icon"
              class="icon icon--table-etiquette"
            />
            <h2>10:00 น. : รับประทานอาหารร่วมกัน</h2>
          </div>
        </div>
      </div>
      <div class="section section--credit">
        <div class="section__bg section__bg--credit"></div>
        <div class="section__content section__content--credit">
          <h1>ขอขอบคุณ</h1>
        </div>
      </div>
    </full-page>
  </div>
</template>

<script>
export default {
  data() {
    const mapApiKey = process.env.MAP_API_KEY;
    const mapZoom = 19;
    const mapCenter = `${process.env.MAP_LOCATION_LAT},${process.env.MAP_LOCATION_LNG}`;
    const mapSize = '1240x1240';
    const mapMarker = `size:tiny|color:red|${mapCenter}`;

    return {
      options: {
        menu: '#menu',
        anchors: ['home', 'date', 'location', 'schedule'],
        scrollOverflow: false,
        controlArrows: true,
        scrollBar: true,
      },

      mapUrl: `https://maps.googleapis.com/maps/api/staticmap?language=th&center=${mapCenter}&scale=2&zoom=${mapZoom}&size=${mapSize}&markers=${mapMarker}&maptype=satellite&key=${mapApiKey}&style=feature:poi|visibility:off`,
      mapLink: process.env.GOOGLE_MAP_LINK,
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

h1,
h2,
h3 {
  margin-top: 5px;
  margin-bottom: 5px;
}

h1 {
  font-size: 26px;
}

h2 {
  font-size: 20px;
}

h3 {
  font-size: 20px;
}

.fp-scroller {
  min-height: 100vh;
}

.section {
  position: relative;
  overflow: hidden;

  &--home {
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

    &--home {
      background-image: url('~/assets/background/page-home.jpg');
    }

    &--two {
      background-image: url('~/assets/background/page-2.jpg');
    }

    &--schedule {
      background-image: url('~/assets/background/page-schedule.jpg');
      background-position: center bottom;
    }

    &--location {
      background-position: center center;
    }

    &--credit {
      background-image: url('~/assets/background/page-credit.jpg');
    }
  }

  &__content {
    position: relative;
    z-index: 2;

    padding: 20px;

    display: flex;
    flex-direction: column;
    height: 100%;
    align-items: center;
    justify-content: center;

    &--home {
      background-color: rgba(255, 117, 160, 0.3);
    }

    &--location {
      background-color: rgba(255, 255, 255, 0.3);
    }
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

.location {
  &-detail {
    text-align: center;
    margin: 100px 0 0;
  }

  &-info {
    margin-bottom: 40px;
  }

  &-link {
    img {
      width: 16px;
      height: 16px;
    }

    text-decoration: none;
    background-color: rgba(117, 117, 117, 0.8);
    padding: 10px;
    border-radius: 10px;
    color: #ffffff;
    transition: all 0.2s ease-in-out;

    &:hover {
      background-color: rgba(255, 255, 255, 0.6);
      color: black;
    }
  }
}

.schedule {
  &-item {
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;

    margin-bottom: 15px;
  }
}

.header {
  &-menu {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    z-index: 10;

    background-color: rgba(255, 255, 255, 0.5);
    padding: 10px;
    font-size: 18px;

    display: flex;
    justify-content: center;

    a {
      display: flex;
      margin: 5px 10px;
      text-decoration: none;
      color: #6b011f;
      transition: all 0.2s ease-in-out;

      &:hover {
        color: #290149;
      }

      &.active {
        color: #f14668;
      }
    }
  }
}
</style>
