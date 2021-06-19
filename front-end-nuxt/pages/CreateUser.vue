<template>
  <div class="w-full max-w-xs">
    <form class="bg-white rounded px-8 pt-6 pb-8 mb-4">
      <div class="mb-4">
        <label class="block text-gray-600 text-sm font-semibold mb-2" :for="{first_name}">
          First name
        </label>
        <input
          class="bg-gray-100 appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          :name="first_name"
          type="text"
          v-model="first_name"
          placeholder="Name"
        />
      </div>
      
      <div class="mb-4">
        <label
          class="block text-gray-600 text-sm font-semibold mb-2"
          :for="salary"
        >
          Salary
        </label>
        <input
          class="bg-gray-100 appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          :name="salary"
          type="text"
          v-model="salary"
          placeholder="Salary"
        />
      </div>

      <div class="mb-4">
        <label
          class="block text-gray-600 text-sm font-semibold mb-2"
          :for="image_path"
        >
          URL
        </label>
        <input
          class="bg-gray-100 appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          :name="image_path"
          type="text"
          v-model="image_path"
          placeholder="Image source"
        />
      </div>
      
          <div class="flex items-center justify-between">
        <button @click="addUser()" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" type="button">
          <router-link :to="{ name: 'index'}">Create</router-link>
        </button>
        <a class="inline-block align-baseline font-bold text-sm text-blue-500 hover:text-blue-800">
           <router-link :to="{ name: 'index'}">Close</router-link>
        </a>
      </div>
    </form>
  </div>
</template>



<script>
import axios from "axios";
const app = axios.create({ baseURL: "http://localhost:8080/api/" });
export default {
  data() {
    return {
      first_name: "",
      salary: "",
      image_path: "",
      companies_id: "",
    };
  },
  async mounted() {},
  methods: {
    async addUser() {
      if (this.first_name == "" || this.image_path == "") {
        console.log("Bad Inputs");
        return;
      } else {
        let user = {
          first_name: this.first_name,
          salary: parseInt(this.salary == "" ? "0" : this.salary),
          companies_id: parseInt(
            this.companies_id == "" ? "0" : this.companies_id
          ),
          image_path: this.image_path,
        };
        const { data, status } = await app.post("users", user);
        console.log(status);
        console.log(data);
        if (status == 200) {
          console.log("200");
          this.$router.push(`/`);
        }
      }
    },
  },
};
</script>