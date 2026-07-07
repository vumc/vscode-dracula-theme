<!-- Once upon a time... -->
<template>
  <article class="vampire">
    <h1>{{ location }}</h1>
    <p>{{ age }} years old</p>
    <ul>
      <li v-for="weakness in weaknesses" :key="weakness">{{ weakness }}</li>
    </ul>
  </article>
</template>

<script>
// ...there was a guy named Vlad
export default {
  name: "Vampire",
  props: {
    location: { type: String, default: "Transylvania" },
    birthDate: { type: Number, default: 1428 },
    deathDate: { type: Number, default: 1476 },
    weaknesses: { type: Array, default: () => ["Sunlight", "Garlic"] },
  },
  computed: {
    age() {
      return this.calcAge();
    },
  },
  methods: {
    calcAge() {
      return this.deathDate - this.birthDate;
    },
  },
};
</script>

<style scoped>
.vampire {
  color: #f8f8f2;
  background-color: #282a36;
}
</style>
