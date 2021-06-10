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
import axios from 'axios'
  export default {
    data() {
      return {
        users:[],
      };
    },
    methods: {
      async addUser() {
        if(this.users.first_name!='' && this.users.salary!=''){
            axios.post('/api/users', {first_name: this.first_name, salary: this.salary, image_path: this.image_path})
            alert("User created")
            console.log(this.data)
        }else{
          alert("Fill all field")
        }
      }
    },
  }
</script>