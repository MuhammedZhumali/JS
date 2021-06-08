<template>
  <div class="container grid grid-cols-3 gap-4 w-10/12 m-3 mx-auto">
    <div class="col-span-1">
      <div v-for="(user, index) in users" :key="user.id" class="">
        <button
          class="
            p-4
            mx-auto
            w-full
            bg-white
            rounded-2xl
            shadow-md
            space-y-2
            sm:py-4
            sm:flex
            sm:items-center
            sm:space-y-0
            transition-all
            sm:space-x-6
            mt-3
            hover:bg-gray-50
            inline-flex
            relative
          "
          @click="getPosts(index)"
        >
          <img class="block h-14 w-14 rounded-full sm:mx-0 sm:flex-shrink-0" :src="users.image_path" alt="" />
          <div class="text-center space-y-2 ml-5 sm:text-left">
            <div class="space-y-0.5">
              <p class="text-lg text-black font-semibold">
                {{ user.first_name }}
              </p>
              <p class="text-gray-500 font-medium">{{ user.salary }}</p>
            </div>
          </div>
          <button
            class="absolute top-3 right-5 opacity-5 hover:opacity-100"
            @click="deleteUser(index)"
          >
            delete
          </button>
        </button>
      </div>
    </div>
    <div class="col-span-2">
      <div v-for="post in posts" :key="post.id">
        <div
          class="
            p-4
            mx-auto
            w-full
            bg-white
            rounded-2xl
            shadow-md
            space-y-2
            sm:py-4
            sm:items-center
            sm:space-y-0
            transition-all
            sm:space-x-6
            mt-3
            hover:bg-gray-50
            px-3
          "
        >
          <h2 class="font-bold">{{ post.title }}</h2>
          <span>{{ post.content }}</span>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
const app = axios.create({ baseURL: "http://localhost:8080/api/" });
export default {
  data() {
    return {
      users: [],
      posts: [],
    };
  },
  async mounted() {
    const { data, status } = await app.get("users");
    console.log(status);
    this.users = data;
  },
  methods: {
    async getCompanies(index) {
      const id = this.users[index].id;
      const { data, status } = await app.get(`users/${id}/companies`);
      console.log(status);
      alert(data.company_name);
    },
    async getPosts(user_id) {
      const id = this.users[user_id].id;
      const { data, status } = await app.get(`posts/${id}`);
      console.log(status);
      console.log(user_id.first_name);
    },
    async deleteUser(index) {
      const id = this.users[index].id;
      const { data, status } = await app.delete(`users/${id}`);
      console.log(status);
      if (status == 200) {
        console.log(data);
        this.users.splice(index);
      }
    },
  },
};
</script>

<style scoped>
</style>

