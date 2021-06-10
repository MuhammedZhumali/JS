<template>
    <div class="w-full h-screen flex items-center justify-center">
        <form class="w-full md:w-1/3 bg-white rounded-lg">
            <h2 class="text-3xl text-center text-gray-700 mb-4">Edit Form</h2>
            <div class="px-12 pb-10">
                <div class="w-full mb-2">
                    <div class="flex items-center">
                        <i class='ml-3 fill-current text-gray-400 text-xs z-10 fas fa-user'></i>
                        <input type='text' placeholder="Username"
                            class="-mx-6 px-8  w-full border rounded px-3 py-2 text-gray-700 focus:outline-none" />
                    </div>
                </div>
                <div class="w-full mb-2">
                    <div class="flex items-center">
                        <i class='ml-3 fill-current text-gray-400 text-xs z-10 fas fa-lock'></i>
                        <input type='text' placeholder="Salary"
                            class="-mx-6 px-8 w-full border rounded px-3 py-2 text-gray-700 focus:outline-none" />
                    </div>
                </div>
                <div class="w-full mb-2">
                    <div class="flex items-center">
                        <i class='ml-3 fill-current text-gray-400 text-xs z-10 fas fa-lock'></i>
                        <input type='text' placeholder="URL image"
                            class="-mx-6 px-8 w-full border rounded px-3 py-2 text-gray-700 focus:outline-none" />
                    </div>
                </div>
                <button type="submit"
                    class="w-full py-2 rounded-full bg-green-600 text-gray-100  focus:outline-none" @click="saveUser()">Save</button>
            </div>
        </form>
    </div>
</template>

<script>
  export default {
    data() {
      return {
        first_name: '',
        salary: Number,
        image_path: '',
        company_id: Number
      };
    },
    methods: {
      async saveUser() {
        if(users.first_name!='' && users.salary!=''){
            
        }else{
          alert("Fill all field")
        }
      }
    },
  }
</script>