<template>
  <div class="w-full max-w-xs center">
    <div class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4 mx-auto center">
      <div class="mb-4">
        <label
          class="block  text-sm font-bold mb-2"
          for="username"
        >
          Name:
        </label>
        <input
          class="
            shadow
            appearance-none
            border
            rounded
            py-2
            px-3
            text-gray-700
            leading-tight
            w-full
          "
          id="username"
          type="text"
          placeholder="Name"
          v-model="user.first_name"
        />
      </div>
      <div class="mb-4">
        <label class="block  text-sm font-bold mb-2" for="salary">
          Salary:
        </label>
        <input
          class="
            shadow
            appearance-none
            border
            rounded
            py-2
            px-3
            text-gray-700
            leading-tight
            w-full
          "
          id="salary"
          type="number"
          placeholder="Salary"
          v-model="user.salary"
        />
      </div>
      <div class="mb-4">
        <label class="block text-sm font-bold mb-2" for="link">
          Image Link:
        </label>
        <input
          class="
            shadow
            appearance-none
            border
            rounded
            py-2
            px-3
            text-gray-700
            leading-tight
            w-full
          "
          id="link"
          type="text"
          placeholder="URL"
          v-model="user.image_path"
        />
      </div>
      <div class="mb-4">
        <label class="block text-sm font-bold mb-2" for="link">
          CompanyId:
        </label>
        <input
          class="
            shadow
            appearance-none
            border
            rounded
            py-2
            px-3
            text-gray-700
            leading-tight
            w-full
          "
          id="link"
          type="number"
          placeholder="1"
          v-model="user.companies_id"
        />
      </div>
      <button
        class="
          border-gray-500
          hover:bg-light-blue-600
          font-semibold
          py-1
          px-4
          rounded
          shadow
        "
        @click="editUser()"
      >
        Save
      </button>
    </div>
  </div>
</template>

<script>
import axios from "axios";
const app = axios.create({ baseURL: "http://localhost:8080/api/" });
export default {
  data() {
    return {
      user_id: 0,
      user: {},
    };
  },
  async mounted() {
    this.user_id = this.$route.query.id;
    const { data, status } = await app.get(`users/${this.user_id}`);
    console.log(status);
    this.user = data;
  },
  methods: {
    async editUser() {
      if (this.first_name == "" || this.image_path == "") {
        console.log("Fill all fields");
        return;
      } else {
        this.user.first_name = this.user.first_name;
        this.user.salary = parseInt(
          this.user.salary == "" ? "0" : this.user.salary
        );
        this.user.companies_id = parseInt(
          this.user.companies_id == "" ? "0" : this.user.companies_id
        );
        this.user.image_path = this.user.image_path;
        const { data, status } = await app.put(
          `users/${this.user_id}`,
          this.user
        );
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
