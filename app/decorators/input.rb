<div class="sm:col-span-4">
  <label for="username" class="block text-sm font-medium leading-6 text-gray-900">Username</label>
  <div class="mt-2">
    <div class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
      <span class="flex select-none items-center pl-3 text-gray-500 sm:text-sm">workcation.com/</span>
      <input type="text" name="username" id="username" autocomplete="username" class="block flex-1 border-0 bg-transparent py-1.5 pl-1 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6" placeholder="janesmith">
    </div>
  </div>
</div>


  def text(f)
    h.content_tag :div, class: "sm:col-span-#{f[:width] || wtxt}" do
      @form.label f[:attribute], f[:label], class; "block text-sm font-medium leading-6 text-gray-900"
      h.content_tag :div, class: "mt-2" do
        h.content_tag :div, class: "flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md" do
          @form.text_field  f[:attribute],
                            f[:autocomplete], 
                            f[:placeholder],
                            class: "block flex-1 border-0 bg-transparent py-1.5 pl-1 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
        end
      end                            
    end
  end
