import { defineNuxtConfig } from 'nuxt'

// https://v3.nuxtjs.org/api/configuration/nuxt.config
export default defineNuxtConfig({
  typescript: {
    strict: true
  },

  modules: [
    '@nuxtjs/color-mode'
  ],

  css: [
    '@/assets/css/global.scss',
    'the-new-css-reset'
  ]
})
