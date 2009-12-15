module GSLng
	backend.instance_eval do
		# memory handling
		attach_function :gsl_matrix_alloc, [ :size_t, :size_t ], :pointer
		attach_function :gsl_matrix_calloc, [ :size_t, :size_t ], :pointer
		attach_function :gsl_matrix_free, [ :pointer ], :void

    # initializing
    attach_function :gsl_matrix_set_all, [ :pointer, :double ], :void
    attach_function :gsl_matrix_set_zero, [ :pointer ], :void
    attach_function :gsl_matrix_set_identity, [ :pointer ], :void

    # copying
    attach_function :gsl_matrix_memcpy, [ :pointer, :pointer ], :int
    attach_function :gsl_matrix_swap, [ :pointer, :pointer ], :int

		# copy rows/columns into
		attach_function :gsl_matrix_get_row, [ :pointer, :pointer, :size_t ], :int
		attach_function :gsl_matrix_get_col, [ :pointer, :pointer, :size_t ], :int
		attach_function :gsl_matrix_set_row, [ :pointer, :size_t, :pointer ], :int
		attach_function :gsl_matrix_set_col, [ :pointer, :size_t, :pointer ], :int

		# element access
    attach_function :gsl_matrix_get, [ :pointer, :size_t, :size_t ], :double
    attach_function :gsl_matrix_set, [ :pointer, :size_t, :size_t, :double ], :void
    
    # properties
    attach_function :gsl_matrix_isnull, [ :pointer ], :int
    attach_function :gsl_matrix_ispos, [ :pointer ], :int
    attach_function :gsl_matrix_isneg, [ :pointer ], :int
    attach_function :gsl_matrix_isnonneg, [ :pointer ], :int
		
    # From local extension
		callback :gsl_matrix_callback, [ :double ], :double
		attach_function :gsl_matrix_map, [ :pointer, :gsl_matrix_callback ], :void

		callback :gsl_matrix_index_callback, [ :size_t, :size_t ], :double
		attach_function :gsl_matrix_map_index, [ :pointer, :gsl_matrix_index_callback ], :void

		callback :gsl_matrix_each_callback, [ :double ], :void
		attach_function :gsl_matrix_each, [ :pointer, :gsl_matrix_each_callback ], :void
	end
end