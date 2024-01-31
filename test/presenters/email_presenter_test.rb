# frozen_string_literal: true

require 'test_helper'

class EmailPresenterTest < ActiveSupport::TestCase
  setup do
    @email = emails(:em_valid)
    @presenter = EmailPresenter.new(@email, nil)
  end

  test 'types returns an array of email types' do
    email_types = @presenter.types
    assert_instance_of(Array, email_types)
    assert_includes(email_types, 'Home')
  end

  test 'primary returns preferred status as Yes or No' do
    @email.preferred = false
    assert_equal  '', @presenter.primary
    @email.preferred = true
    assert_equal  'Yes', @presenter.primary
  end

  test 'returns a note hint' do 
    @email.note = 'a very long note does not fit in the index table'
    note_hint =   'a very long note doe...'
    assert_equal note_hint, @presenter.note_hint    
  end

  test 'returns a sorted array of arrays: persons for selection' do
    person_list = @presenter.person_list
    assert_instance_of(Array, person_list)
    assert_instance_of(Array, person_list.first)
  end

  test 'returns the fullname of the associated addressee' do
    fullname = 'Robert A Heinlin'
    assert_equal fullname, @presenter.addressee
    assert_equal fullname, @presenter.assoc_name  
    assert_equal fullname, @presenter.person_fullname  
  end

  test 'returns <model>_path if model has an id assigned' do
    email_path = "/emails/#{ @email.id }"
    assert_equal email_path, @presenter.instance_path
  end

  test 'returns nil if model id is not assigned' do  
    @email.id = nil
    assert_nil @presenter.instance_path
  end

  test 'collection_path returns the emails_path' do
    path = '/emails'
    assert_equal path, @presenter.collection_path
  end

  test 'returns belongs_to_path if <assoc>_id assigned' do
    path = "/people/#{ @email.person_id }"
    assert_equal path, @presenter.belongs_to_path
  end

  test 'returns the belongs_to assoc class name' do  
    assert_equal 'Person', @presenter.belongs_to_name
  end

  test 'form_rows returns an array of hashes' do 
    fr = @presenter.form_rows
    assert_instance_of(Array, fr)
    assert_instance_of(Hash, fr[0])
    assert_equal :elements, fr[0].keys[0]
  end

  test 'element_info returns a hash of hashes' do 
    ei = @presenter.element_info
    assert_instance_of(Hash, ei)
    assert_instance_of(Hash, ei.shift[1])
  end
end
