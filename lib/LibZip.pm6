use v6;

unit module LibZip;

use NativeCall;

constant LIB = 'libzip.so';

## Enumerations
# == /usr/include/zip.h ==

enum zip_source_cmd is export (
   ZIP_SOURCE_OPEN => 0,
   ZIP_SOURCE_READ => 1,
   ZIP_SOURCE_CLOSE => 2,
   ZIP_SOURCE_STAT => 3,
   ZIP_SOURCE_ERROR => 4,
   ZIP_SOURCE_FREE => 5
);

## Structures
# == /usr/include/zip.h ==

class uint64_t is uint64 { }

class zip_stat is repr('CStruct') is export {
  has uint64_t                      $.valid; # Typedef<zip_uint64_t>->|Typedef<uint64_t>->|long unsigned int|| valid
  has Str                           $.name; # const char* name
  has uint64_t                      $.index; # Typedef<zip_uint64_t>->|Typedef<uint64_t>->|long unsigned int|| index
  has uint64_t                      $.size; # Typedef<zip_uint64_t>->|Typedef<uint64_t>->|long unsigned int|| size
  has uint64_t                      $.comp_size; # Typedef<zip_uint64_t>->|Typedef<uint64_t>->|long unsigned int|| comp_size
  has __time_t                      $.mtime; # Typedef<time_t>->|Typedef<__time_t>->|long int|| mtime
  has uint32_t                      $.crc; # Typedef<zip_uint32_t>->|Typedef<uint32_t>->|unsigned int|| crc
  has uint16_t                      $.comp_method; # Typedef<zip_uint16_t>->|Typedef<uint16_t>->|short unsigned int|| comp_method
  has uint16_t                      $.encryption_method; # Typedef<zip_uint16_t>->|Typedef<uint16_t>->|short unsigned int|| encryption_method
  has uint32_t                      $.flags; # Typedef<zip_uint32_t>->|Typedef<uint32_t>->|unsigned int|| flags
}

class zip is repr('CStruct') is export { }
class zip_file is repr('CStruct') is export { }
class zip_source is repr('CStruct') is export { }


## Functions

#-From /usr/include/zip.h:208
#ZIP_EXTERN zip_int64_t zip_add(struct zip *, const char *, struct zip_source *);
sub zip_add(Pointer[zip]                   # zip*
           ,Str                            # const char*
           ,Pointer[zip_source]            # zip_source*
            ) is native(LIB) returns int64_t is export { * }

#-From /usr/include/zip.h:209
#ZIP_EXTERN zip_int64_t zip_add_dir(struct zip *, const char *);
sub zip_add_dir(Pointer[zip]                   # zip*
               ,Str                            # const char*
                ) is native(LIB) returns int64_t is export { * }

#-From /usr/include/zip.h:210
#ZIP_EXTERN int zip_close(struct zip *);
sub zip_close(Pointer[zip]  # zip*
              ) is native(LIB) returns int32 is export { * }

#-From /usr/include/zip.h:211
#ZIP_EXTERN int zip_delete(struct zip *, zip_uint64_t);
sub zip_delete(Pointer[zip]                   # zip*
              ,uint64_t                       # Typedef<zip_uint64_t>->|Typedef<uint64_t>->|long unsigned int||
               ) is native(LIB) returns int32 is export { * }

#-From /usr/include/zip.h:212
#ZIP_EXTERN void zip_error_clear(struct zip *);
sub zip_error_clear(Pointer[zip]  # zip*
                    ) is native(LIB)  is export { * }

#-From /usr/include/zip.h:213
#ZIP_EXTERN void zip_error_get(struct zip *, int *, int *);
sub zip_error_get(Pointer[zip]                   # zip*
                 ,Pointer[int32]                 # int*
                 ,Pointer[int32]                 # int*
                  ) is native(LIB)  is export { * }

#-From /usr/include/zip.h:214
#ZIP_EXTERN int zip_error_get_sys_type(int);
sub zip_error_get_sys_type(int32  # int
                           ) is native(LIB) returns int32 is export { * }

#-From /usr/include/zip.h:215
#ZIP_EXTERN int zip_error_to_str(char *, zip_uint64_t, int, int);
sub zip_error_to_str(Str                            # char*
                    ,uint64_t                       # Typedef<zip_uint64_t>->|Typedef<uint64_t>->|long unsigned int||
                    ,int32                          # int
                    ,int32                          # int
                     ) is native(LIB) returns int32 is export { * }

#-From /usr/include/zip.h:216
#ZIP_EXTERN int zip_fclose(struct zip_file *);
sub zip_fclose(Pointer[zip_file]  # zip_file*
               ) is native(LIB) returns int32 is export { * }

#-From /usr/include/zip.h:217
#ZIP_EXTERN struct zip *zip_fdopen(int, int, int *);
sub zip_fdopen(int32                          # int
              ,int32                          # int
              ,Pointer[int32]                 # int*
               ) is native(LIB) returns Pointer[zip] is export { * }

#-From /usr/include/zip.h:218
#ZIP_EXTERN void zip_file_error_clear(struct zip_file *);
sub zip_file_error_clear(Pointer[zip_file]  # zip_file*
                         ) is native(LIB)  is export { * }

#-From /usr/include/zip.h:219
#ZIP_EXTERN void zip_file_error_get(struct zip_file *, int *, int *);
sub zip_file_error_get(Pointer[zip_file]              # zip_file*
                      ,Pointer[int32]                 # int*
                      ,Pointer[int32]                 # int*
                       ) is native(LIB)  is export { * }

#-From /usr/include/zip.h:220
#ZIP_EXTERN const char *zip_file_strerror(struct zip_file *);
sub zip_file_strerror(Pointer[zip_file]  # zip_file*
                      ) is native(LIB) returns Str is export { * }

#-From /usr/include/zip.h:221
#ZIP_EXTERN struct zip_file *zip_fopen(struct zip *, const char *, int);
sub zip_fopen(Pointer[zip]                   # zip*
             ,Str                            # const char*
             ,int32                          # int
              ) is native(LIB) returns Pointer[zip_file] is export { * }

#-From /usr/include/zip.h:223
#ZIP_EXTERN struct zip_file *zip_fopen_encrypted(struct zip *, const char *,
#						int, const char *);
sub zip_fopen_encrypted(Pointer[zip]                   # zip*
                       ,Str                            # const char*
                       ,int32                          # int
                       ,Str                            # const char*
                        ) is native(LIB) returns Pointer[zip_file] is export { * }

#-From /usr/include/zip.h:224
#ZIP_EXTERN struct zip_file *zip_fopen_index(struct zip *, zip_uint64_t, int);
sub zip_fopen_index(Pointer[zip]                   # zip*
                   ,uint64_t                       # Typedef<zip_uint64_t>->|Typedef<uint64_t>->|long unsigned int||
                   ,int32                          # int
                    ) is native(LIB) returns Pointer[zip_file] is export { * }

#-From /usr/include/zip.h:227
#ZIP_EXTERN struct zip_file *zip_fopen_index_encrypted(struct zip *,
#						      zip_uint64_t, int,
#						      const char *);
sub zip_fopen_index_encrypted(Pointer[zip]                   # zip*
                             ,uint64_t                       # Typedef<zip_uint64_t>->|Typedef<uint64_t>->|long unsigned int||
                             ,int32                          # int
                             ,Str                            # const char*
                              ) is native(LIB) returns Pointer[zip_file] is export { * }

#-From /usr/include/zip.h:228
#ZIP_EXTERN zip_int64_t zip_fread(struct zip_file *, void *, zip_uint64_t);
sub zip_fread(Pointer[zip_file]              # zip_file*
             ,Pointer                        # void*
             ,uint64_t                       # Typedef<zip_uint64_t>->|Typedef<uint64_t>->|long unsigned int||
              ) is native(LIB) returns int64_t is export { * }

#-From /usr/include/zip.h:229
#ZIP_EXTERN const char *zip_get_archive_comment(struct zip *, int *, int);
sub zip_get_archive_comment(Pointer[zip]                   # zip*
                           ,Pointer[int32]                 # int*
                           ,int32                          # int
                            ) is native(LIB) returns Str is export { * }

#-From /usr/include/zip.h:230
#ZIP_EXTERN int zip_get_archive_flag(struct zip *, int, int);
sub zip_get_archive_flag(Pointer[zip]                   # zip*
                        ,int32                          # int
                        ,int32                          # int
                         ) is native(LIB) returns int32 is export { * }

#-From /usr/include/zip.h:232
#ZIP_EXTERN const char *zip_get_file_comment(struct zip *, zip_uint64_t,
#					    int *, int);
sub zip_get_file_comment(Pointer[zip]                   # zip*
                        ,uint64_t                       # Typedef<zip_uint64_t>->|Typedef<uint64_t>->|long unsigned int||
                        ,Pointer[int32]                 # int*
                        ,int32                          # int
                         ) is native(LIB) returns Str is export { * }

#-From /usr/include/zip.h:234
#ZIP_EXTERN const char *zip_get_file_extra(struct zip *, zip_uint64_t,
#					  int *, int);
sub zip_get_file_extra(Pointer[zip]                   # zip*
                      ,uint64_t                       # Typedef<zip_uint64_t>->|Typedef<uint64_t>->|long unsigned int||
                      ,Pointer[int32]                 # int*
                      ,int32                          # int
                       ) is native(LIB) returns Str is export { * }

#-From /usr/include/zip.h:235
#ZIP_EXTERN const char *zip_get_name(struct zip *, zip_uint64_t, int);
sub zip_get_name(Pointer[zip]                   # zip*
                ,uint64_t                       # Typedef<zip_uint64_t>->|Typedef<uint64_t>->|long unsigned int||
                ,int32                          # int
                 ) is native(LIB) returns Str is export { * }

#-From /usr/include/zip.h:236
#ZIP_EXTERN zip_uint64_t zip_get_num_entries(struct zip *, int);
sub zip_get_num_entries(Pointer[zip]                   # zip*
                       ,int32                          # int
                        ) is native(LIB) returns uint64_t is export { * }

#-From /usr/include/zip.h:237
#ZIP_EXTERN int zip_get_num_files(struct zip *);  /* deprecated, use zip_get_num_entries instead */
sub zip_get_num_files(Pointer[zip]  # zip*
                      ) is native(LIB) returns int32 is export { * }

#-From /usr/include/zip.h:238
#ZIP_EXTERN int zip_name_locate(struct zip *, const char *, int);
sub zip_name_locate(Pointer[zip]                   # zip*
                   ,Str                            # const char*
                   ,int32                          # int
                    ) is native(LIB) returns int32 is export { * }

#-From /usr/include/zip.h:239
#ZIP_EXTERN struct zip *zip_open(const char *, int, int *);
sub zip_open(Str                            # const char*
            ,int32                          # int
            ,Pointer[int32]                 # int*
             ) is native(LIB) returns Pointer[zip] is export { * }

#-From /usr/include/zip.h:240
#ZIP_EXTERN int zip_rename(struct zip *, zip_uint64_t, const char *);
sub zip_rename(Pointer[zip]                   # zip*
              ,uint64_t                       # Typedef<zip_uint64_t>->|Typedef<uint64_t>->|long unsigned int||
              ,Str                            # const char*
               ) is native(LIB) returns int32 is export { * }

#-From /usr/include/zip.h:241
#ZIP_EXTERN int zip_replace(struct zip *, zip_uint64_t, struct zip_source *);
sub zip_replace(Pointer[zip]                   # zip*
               ,uint64_t                       # Typedef<zip_uint64_t>->|Typedef<uint64_t>->|long unsigned int||
               ,Pointer[zip_source]            # zip_source*
                ) is native(LIB) returns int32 is export { * }

#-From /usr/include/zip.h:242
#ZIP_EXTERN int zip_set_archive_comment(struct zip *, const char *, int);
sub zip_set_archive_comment(Pointer[zip]                   # zip*
                           ,Str                            # const char*
                           ,int32                          # int
                            ) is native(LIB) returns int32 is export { * }

#-From /usr/include/zip.h:243
#ZIP_EXTERN int zip_set_archive_flag(struct zip *, int, int);
sub zip_set_archive_flag(Pointer[zip]                   # zip*
                        ,int32                          # int
                        ,int32                          # int
                         ) is native(LIB) returns int32 is export { * }

#-From /usr/include/zip.h:244
#ZIP_EXTERN int zip_set_default_password(struct zip *, const char *);
sub zip_set_default_password(Pointer[zip]                   # zip*
                            ,Str                            # const char*
                             ) is native(LIB) returns int32 is export { * }

#-From /usr/include/zip.h:246
#ZIP_EXTERN int zip_set_file_comment(struct zip *, zip_uint64_t,
#				    const char *, int);
sub zip_set_file_comment(Pointer[zip]                   # zip*
                        ,uint64_t                       # Typedef<zip_uint64_t>->|Typedef<uint64_t>->|long unsigned int||
                        ,Str                            # const char*
                        ,int32                          # int
                         ) is native(LIB) returns int32 is export { * }

#-From /usr/include/zip.h:248
#ZIP_EXTERN int zip_set_file_extra(struct zip *, zip_uint64_t,
#				  const char *, int);
sub zip_set_file_extra(Pointer[zip]                   # zip*
                      ,uint64_t                       # Typedef<zip_uint64_t>->|Typedef<uint64_t>->|long unsigned int||
                      ,Str                            # const char*
                      ,int32                          # int
                       ) is native(LIB) returns int32 is export { * }

#-From /usr/include/zip.h:250
#ZIP_EXTERN struct zip_source *zip_source_buffer(struct zip *, const void *,
#						zip_uint64_t, int);
sub zip_source_buffer(Pointer[zip]                   # zip*
                     ,Pointer                        # const void*
                     ,uint64_t                       # Typedef<zip_uint64_t>->|Typedef<uint64_t>->|long unsigned int||
                     ,int32                          # int
                      ) is native(LIB) returns Pointer[zip_source] is export { * }

#-From /usr/include/zip.h:252
#ZIP_EXTERN struct zip_source *zip_source_file(struct zip *, const char *,
#					      zip_uint64_t, zip_int64_t);
sub zip_source_file(Pointer[zip]                   # zip*
                   ,Str                            # const char*
                   ,uint64_t                       # Typedef<zip_uint64_t>->|Typedef<uint64_t>->|long unsigned int||
                   ,int64_t                        # Typedef<zip_int64_t>->|Typedef<int64_t>->|long int||
                    ) is native(LIB) returns Pointer[zip_source] is export { * }

#-From /usr/include/zip.h:254
#ZIP_EXTERN struct zip_source *zip_source_filep(struct zip *, FILE *,
#					       zip_uint64_t, zip_int64_t);
sub zip_source_filep(Pointer[zip]                   # zip*
                    ,Pointer[_IO_FILE]              # Typedef<FILE>->|_IO_FILE|*
                    ,uint64_t                       # Typedef<zip_uint64_t>->|Typedef<uint64_t>->|long unsigned int||
                    ,int64_t                        # Typedef<zip_int64_t>->|Typedef<int64_t>->|long int||
                     ) is native(LIB) returns Pointer[zip_source] is export { * }

#-From /usr/include/zip.h:255
#ZIP_EXTERN void zip_source_free(struct zip_source *);
sub zip_source_free(Pointer[zip_source]  # zip_source*
                    ) is native(LIB)  is export { * }

#-From /usr/include/zip.h:257
#ZIP_EXTERN struct zip_source *zip_source_function(struct zip *,
#						  zip_source_callback, void *);
sub zip_source_function(Pointer[zip]                   # zip*
                       ,& (Pointer, Pointer, uint64_t, int32 --> int64_t) # Typedef<zip_source_callback>->|F:Typedef<zip_int64_t>->|Typedef<int64_t>->|long int|| ( void*, void*, Typedef<zip_uint64_t>->|Typedef<uint64_t>->|long unsigned int||, zip_source_cmd)*|
                       ,Pointer                        # void*
                        ) is native(LIB) returns Pointer[zip_source] is export { * }

#-From /usr/include/zip.h:260
#ZIP_EXTERN struct zip_source *zip_source_zip(struct zip *, struct zip *,
#					     zip_uint64_t, int,
#					     zip_uint64_t, zip_int64_t);
sub zip_source_zip(Pointer[zip]                   # zip*
                  ,Pointer[zip]                   # zip*
                  ,uint64_t                       # Typedef<zip_uint64_t>->|Typedef<uint64_t>->|long unsigned int||
                  ,int32                          # int
                  ,uint64_t                       # Typedef<zip_uint64_t>->|Typedef<uint64_t>->|long unsigned int||
                  ,int64_t                        # Typedef<zip_int64_t>->|Typedef<int64_t>->|long int||
                   ) is native(LIB) returns Pointer[zip_source] is export { * }

#-From /usr/include/zip.h:261
#ZIP_EXTERN int zip_stat(struct zip *, const char *, int, struct zip_stat *);
sub zip_stat(Pointer[zip]                   # zip*
            ,Str                            # const char*
            ,int32                          # int
            ,Pointer[zip_stat]              # zip_stat*
             ) is native(LIB) returns int32 is export { * }

#-From /usr/include/zip.h:263
#ZIP_EXTERN int zip_stat_index(struct zip *, zip_uint64_t, int,
#			      struct zip_stat *);
sub zip_stat_index(Pointer[zip]                   # zip*
                  ,uint64_t                       # Typedef<zip_uint64_t>->|Typedef<uint64_t>->|long unsigned int||
                  ,int32                          # int
                  ,Pointer[zip_stat]              # zip_stat*
                   ) is native(LIB) returns int32 is export { * }

#-From /usr/include/zip.h:264
#ZIP_EXTERN void zip_stat_init(struct zip_stat *);
sub zip_stat_init(Pointer[zip_stat]  # zip_stat*
                  ) is native(LIB)  is export { * }

#-From /usr/include/zip.h:265
#ZIP_EXTERN const char *zip_strerror(struct zip *);
sub zip_strerror(Pointer[zip]  # zip*
                 ) is native(LIB) returns Str is export { * }

#-From /usr/include/zip.h:266
#ZIP_EXTERN int zip_unchange(struct zip *, zip_uint64_t);
sub zip_unchange(Pointer[zip]                   # zip*
                ,uint64_t                       # Typedef<zip_uint64_t>->|Typedef<uint64_t>->|long unsigned int||
                 ) is native(LIB) returns int32 is export { * }

#-From /usr/include/zip.h:267
#ZIP_EXTERN int zip_unchange_all(struct zip *);
sub zip_unchange_all(Pointer[zip]  # zip*
                     ) is native(LIB) returns int32 is export { * }

#-From /usr/include/zip.h:268
#ZIP_EXTERN int zip_unchange_archive(struct zip *);
sub zip_unchange_archive(Pointer[zip]  # zip*
                         ) is native(LIB) returns int32 is export { * }

=begin pod

=head1 NAME

LibZip - Perl 6 bindings for libzip

=head1 SYNOPSIS

  use LibZip;

=head1 DESCRIPTION

LibZip provides Perl 6 bindings for L<libzip|http://www.nih.at/libzip/libzip.html>.

=head1 AUTHOR

Ahmad M. Zawawi <ahmad.zawawi@gmail.com>

=head1 COPYRIGHT AND LICENSE

Copyright 2016 Ahmad M. Zawawi under the MIT License

=end pod
