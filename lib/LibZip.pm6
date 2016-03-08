use v6;

unit module LibZip;

use NativeCall;

constant LIB = 'libzip.so';


## Constants
# Create the archive if it does not exist.
constant ZIP_CREATE   is export = 1;

# Error if archive already exists.
constant ZIP_EXCL     is export = 2;

# Perform additional stricter consistency checks on the archive, and error if
# they fail.
constant ZIP_CHECKCONS is export = 4;

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

class zip_stat is repr('CStruct') is export {
  # Typedef<zip_int64>->|Typedef<int64>->|long unsigned int|| valid
  has int64  $.valid;

  # const char* name
  has Str    $.name;

  # Typedef<zip_int64>->|Typedef<int64>->|long unsigned int|| index
  has int64  $.index;

  # Typedef<zip_int64>->|Typedef<int64>->|long unsigned int|| size
  has int64  $.size;

  # Typedef<zip_int64>->|Typedef<int64>->|long unsigned int|| comp_size
  has int64  $.comp_size;

  # Typedef<time_t>->|Typedef<__time_t>->|long int|| mtime
  has int32  $.mtime;

  # Typedef<zip_uint32_t>->|Typedef<uint32_t>->|unsigned int|| crc
  has uint32 $.crc;

  # Typedef<zip_uint16_t>->|Typedef<uint16_t>->|short unsigned int|| comp_method
  has uint16 $.comp_method;

  # Typedef<zip_uint16_t>->|Typedef<uint16_t>->|short unsigned int|| encryption_method
  has uint16 $.encryption_method;

  # Typedef<zip_uint32_t>->|Typedef<uint32_t>->|unsigned int|| flags
  has uint32 $.flags;
}

class zip is repr('CStruct') is export { }
class zip_file is repr('CStruct') is export { }
class zip_source is repr('CStruct') is export { }


## Functions

#
#ZIP_EXTERN zip_int64_t zip_add(struct zip *, const char *, struct zip_source *);
sub zip_add(Pointer[zip]                   # zip*
           ,Str                            # const char*
           ,Pointer[zip_source]            # zip_source*
            ) is native(LIB) returns int64 is export { * }

#
#ZIP_EXTERN zip_int64_t zip_add_dir(struct zip *, const char *);
sub zip_add_dir(Pointer[zip]                   # zip*
               ,Str                            # const char*
                ) is native(LIB) returns int64 is export { * }

#
#ZIP_EXTERN int zip_close(struct zip *);
sub zip_close(Pointer[zip]  # zip*
              ) is native(LIB) returns int32 is export { * }

#
#ZIP_EXTERN int zip_delete(struct zip *, zip_int64);
sub zip_delete(Pointer[zip]                   # zip*
              ,int64                       # Typedef<zip_int64>->|Typedef<int64>->|long unsigned int||
               ) is native(LIB) returns int32 is export { * }

#
#ZIP_EXTERN void zip_error_clear(struct zip *);
sub zip_error_clear(Pointer[zip]  # zip*
                    ) is native(LIB)  is export { * }

#
#ZIP_EXTERN void zip_error_get(struct zip *, int *, int *);
sub zip_error_get(Pointer[zip]                   # zip*
                 ,Pointer[int32]                 # int*
                 ,Pointer[int32]                 # int*
                  ) is native(LIB)  is export { * }

#
#ZIP_EXTERN int zip_error_get_sys_type(int);
sub zip_error_get_sys_type(int32  # int
                           ) is native(LIB) returns int32 is export { * }

#
#ZIP_EXTERN int zip_error_to_str(char *, zip_int64, int, int);
sub zip_error_to_str(Str                            # char*
                    ,int64                       # Typedef<zip_int64>->|Typedef<int64>->|long unsigned int||
                    ,int32                          # int
                    ,int32                          # int
                     ) is native(LIB) returns int32 is export { * }

#
#ZIP_EXTERN int zip_fclose(struct zip_file *);
sub zip_fclose(Pointer[zip_file]  # zip_file*
               ) is native(LIB) returns int32 is export { * }

#
#ZIP_EXTERN struct zip *zip_fdopen(int, int, int *);
sub zip_fdopen(int32                          # int
              ,int32                          # int
              ,Pointer[int32]                 # int*
               ) is native(LIB) returns Pointer[zip] is export { * }

#
#ZIP_EXTERN void zip_file_error_clear(struct zip_file *);
sub zip_file_error_clear(Pointer[zip_file]  # zip_file*
                         ) is native(LIB)  is export { * }

#
#ZIP_EXTERN void zip_file_error_get(struct zip_file *, int *, int *);
sub zip_file_error_get(Pointer[zip_file]              # zip_file*
                      ,Pointer[int32]                 # int*
                      ,Pointer[int32]                 # int*
                       ) is native(LIB)  is export { * }

#
#ZIP_EXTERN const char *zip_file_strerror(struct zip_file *);
sub zip_file_strerror(Pointer[zip_file]  # zip_file*
                      ) is native(LIB) returns Str is export { * }

#
#ZIP_EXTERN struct zip_file *zip_fopen(struct zip *, const char *, int);
sub zip_fopen(Pointer[zip]                   # zip*
             ,Str                            # const char*
             ,int32                          # int
              ) is native(LIB) returns Pointer[zip_file] is export { * }

#
#ZIP_EXTERN struct zip_file *zip_fopen_encrypted(struct zip *, const char *,
#						int, const char *);
sub zip_fopen_encrypted(Pointer[zip]                   # zip*
                       ,Str                            # const char*
                       ,int32                          # int
                       ,Str                            # const char*
                        ) is native(LIB) returns Pointer[zip_file] is export { * }

#
#ZIP_EXTERN struct zip_file *zip_fopen_index(struct zip *, zip_int64, int);
sub zip_fopen_index(Pointer[zip]                   # zip*
                   ,int64                       # Typedef<zip_int64>->|Typedef<int64>->|long unsigned int||
                   ,int32                          # int
                    ) is native(LIB) returns Pointer[zip_file] is export { * }

#
#ZIP_EXTERN struct zip_file *zip_fopen_index_encrypted(struct zip *,
#						      zip_int64, int,
#						      const char *);
sub zip_fopen_index_encrypted(Pointer[zip]                   # zip*
                             ,int64                       # Typedef<zip_int64>->|Typedef<int64>->|long unsigned int||
                             ,int32                          # int
                             ,Str                            # const char*
                              ) is native(LIB) returns Pointer[zip_file] is export { * }

#
#ZIP_EXTERN zip_int64_t zip_fread(struct zip_file *, void *, zip_int64);
sub zip_fread(Pointer[zip_file]              # zip_file*
             ,Pointer                        # void*
             ,int64                       # Typedef<zip_int64>->|Typedef<int64>->|long unsigned int||
              ) is native(LIB) returns int64 is export { * }

#
#ZIP_EXTERN const char *zip_get_archive_comment(struct zip *, int *, int);
sub zip_get_archive_comment(Pointer[zip]                   # zip*
                           ,Pointer[int32]                 # int*
                           ,int32                          # int
                            ) is native(LIB) returns Str is export { * }

#
#ZIP_EXTERN int zip_get_archive_flag(struct zip *, int, int);
sub zip_get_archive_flag(Pointer[zip]                   # zip*
                        ,int32                          # int
                        ,int32                          # int
                         ) is native(LIB) returns int32 is export { * }

#
#ZIP_EXTERN const char *zip_get_file_comment(struct zip *, zip_int64,
#					    int *, int);
sub zip_get_file_comment(Pointer[zip]                   # zip*
                        ,int64                       # Typedef<zip_int64>->|Typedef<int64>->|long unsigned int||
                        ,Pointer[int32]                 # int*
                        ,int32                          # int
                         ) is native(LIB) returns Str is export { * }

#
#ZIP_EXTERN const char *zip_get_file_extra(struct zip *, zip_int64,
#					  int *, int);
sub zip_get_file_extra(Pointer[zip]                   # zip*
                      ,int64                       # Typedef<zip_int64>->|Typedef<int64>->|long unsigned int||
                      ,Pointer[int32]                 # int*
                      ,int32                          # int
                       ) is native(LIB) returns Str is export { * }

#
#ZIP_EXTERN const char *zip_get_name(struct zip *, zip_int64, int);
sub zip_get_name(Pointer[zip]                   # zip*
                ,int64                       # Typedef<zip_int64>->|Typedef<int64>->|long unsigned int||
                ,int32                          # int
                 ) is native(LIB) returns Str is export { * }

#
#ZIP_EXTERN zip_int64 zip_get_num_entries(struct zip *, int);
sub zip_get_num_entries(Pointer[zip]                   # zip*
                       ,int32                          # int
                        ) is native(LIB) returns int64 is export { * }

#
#ZIP_EXTERN int zip_get_num_files(struct zip *);  /* deprecated, use zip_get_num_entries instead */
sub zip_get_num_files(Pointer[zip]  # zip*
                      ) is native(LIB) returns int32 is export { * }

#
#ZIP_EXTERN int zip_name_locate(struct zip *, const char *, int);
sub zip_name_locate(Pointer[zip]                   # zip*
                   ,Str                            # const char*
                   ,int32                          # int
                    ) is native(LIB) returns int32 is export { * }

#
#ZIP_EXTERN struct zip *zip_open(const char *, int, int *);
sub zip_open(Str                            # const char*
            ,int32                          # int
            ,Pointer[int32]                 # int*
             ) is native(LIB) returns Pointer[zip] is export { * }

#
#ZIP_EXTERN int zip_rename(struct zip *, zip_int64, const char *);
sub zip_rename(Pointer[zip]                   # zip*
              ,int64                       # Typedef<zip_int64>->|Typedef<int64>->|long unsigned int||
              ,Str                            # const char*
               ) is native(LIB) returns int32 is export { * }

#
#ZIP_EXTERN int zip_replace(struct zip *, zip_int64, struct zip_source *);
sub zip_replace(Pointer[zip]                   # zip*
               ,int64                       # Typedef<zip_int64>->|Typedef<int64>->|long unsigned int||
               ,Pointer[zip_source]            # zip_source*
                ) is native(LIB) returns int32 is export { * }

#
#ZIP_EXTERN int zip_set_archive_comment(struct zip *, const char *, int);
sub zip_set_archive_comment(Pointer[zip]                   # zip*
                           ,Str                            # const char*
                           ,int32                          # int
                            ) is native(LIB) returns int32 is export { * }

#
#ZIP_EXTERN int zip_set_archive_flag(struct zip *, int, int);
sub zip_set_archive_flag(Pointer[zip]                   # zip*
                        ,int32                          # int
                        ,int32                          # int
                         ) is native(LIB) returns int32 is export { * }

#
#ZIP_EXTERN int zip_set_default_password(struct zip *, const char *);
sub zip_set_default_password(Pointer[zip]                   # zip*
                            ,Str                            # const char*
                             ) is native(LIB) returns int32 is export { * }

#
#ZIP_EXTERN int zip_set_file_comment(struct zip *, zip_int64,
#				    const char *, int);
sub zip_set_file_comment(Pointer[zip]                   # zip*
                        ,int64                       # Typedef<zip_int64>->|Typedef<int64>->|long unsigned int||
                        ,Str                            # const char*
                        ,int32                          # int
                         ) is native(LIB) returns int32 is export { * }

#
#ZIP_EXTERN int zip_set_file_extra(struct zip *, zip_int64,
#				  const char *, int);
sub zip_set_file_extra(Pointer[zip]                   # zip*
                      ,int64                       # Typedef<zip_int64>->|Typedef<int64>->|long unsigned int||
                      ,Str                            # const char*
                      ,int32                          # int
                       ) is native(LIB) returns int32 is export { * }

#
#ZIP_EXTERN struct zip_source *zip_source_buffer(struct zip *, const void *,
#						zip_int64, int);
sub zip_source_buffer(Pointer[zip]                   # zip*
                     ,Pointer                        # const void*
                     ,int64                       # Typedef<zip_int64>->|Typedef<int64>->|long unsigned int||
                     ,int32                          # int
                      ) is native(LIB) returns Pointer[zip_source] is export { * }

#
#ZIP_EXTERN struct zip_source *zip_source_file(struct zip *, const char *,
#					      zip_int64, zip_int64_t);
sub zip_source_file(Pointer[zip]                   # zip*
                   ,Str                            # const char*
                   ,int64                       # Typedef<zip_int64>->|Typedef<int64>->|long unsigned int||
                   ,int64                        # Typedef<zip_int64_t>->|Typedef<int64_t>->|long int||
                    ) is native(LIB) returns Pointer[zip_source] is export { * }

#
#ZIP_EXTERN struct zip_source *zip_source_filep(struct zip *, FILE *,
#					       zip_int64, zip_int64_t);
#sub zip_source_filep(Pointer[zip]                   # zip*
#                    ,Pointer[_IO_FILE]              # Typedef<FILE>->|_IO_FILE|*
#                    ,int64                       # Typedef<zip_int64>->|Typedef<int64>->|long unsigned int||
#                    ,int64_t                        # Typedef<zip_int64_t>->|Typedef<int64_t>->|long int||
#                     ) is native(LIB) returns Pointer[zip_source] is export { * }

#
#ZIP_EXTERN void zip_source_free(struct zip_source *);
sub zip_source_free(Pointer[zip_source]  # zip_source*
                    ) is native(LIB)  is export { * }

#
#ZIP_EXTERN struct zip_source *zip_source_function(struct zip *,
#						  zip_source_callback, void *);
sub zip_source_function(Pointer[zip]                   # zip*
                       ,& (Pointer, Pointer, int64, int32 --> int64) # Typedef<zip_source_callback>->|F:Typedef<zip_int64_t>->|Typedef<int64_t>->|long int|| ( void*, void*, Typedef<zip_int64>->|Typedef<int64>->|long unsigned int||, zip_source_cmd)*|
                       ,Pointer                        # void*
                        ) is native(LIB) returns Pointer[zip_source] is export { * }

#
#ZIP_EXTERN struct zip_source *zip_source_zip(struct zip *, struct zip *,
#					     zip_int64, int,
#					     zip_int64, zip_int64_t);
sub zip_source_zip(Pointer[zip]                   # zip*
                  ,Pointer[zip]                   # zip*
                  ,int64                       # Typedef<zip_int64>->|Typedef<int64>->|long unsigned int||
                  ,int32                          # int
                  ,int64                       # Typedef<zip_int64>->|Typedef<int64>->|long unsigned int||
                  ,int64                        # Typedef<zip_int64_t>->|Typedef<int64_t>->|long int||
                   ) is native(LIB) returns Pointer[zip_source] is export { * }

#
#ZIP_EXTERN int zip_stat(struct zip *, const char *, int, struct zip_stat *);
sub zip_stat(Pointer[zip]                   # zip*
            ,Str                            # const char*
            ,int32                          # int
            ,Pointer[zip_stat]              # zip_stat*
             ) is native(LIB) returns int32 is export { * }

#
#ZIP_EXTERN int zip_stat_index(struct zip *, zip_int64, int,
#			      struct zip_stat *);
sub zip_stat_index(Pointer[zip]                   # zip*
                  ,int64                       # Typedef<zip_int64>->|Typedef<int64>->|long unsigned int||
                  ,int32                          # int
                  ,Pointer[zip_stat]              # zip_stat*
                   ) is native(LIB) returns int32 is export { * }

#
#ZIP_EXTERN void zip_stat_init(struct zip_stat *);
sub zip_stat_init(Pointer[zip_stat]  # zip_stat*
                  ) is native(LIB)  is export { * }

#
#ZIP_EXTERN const char *zip_strerror(struct zip *);
sub zip_strerror(Pointer[zip]  # zip*
                 ) is native(LIB) returns Str is export { * }

#
#ZIP_EXTERN int zip_unchange(struct zip *, zip_int64);
sub zip_unchange(Pointer[zip]                   # zip*
                ,int64                       # Typedef<zip_int64>->|Typedef<int64>->|long unsigned int||
                 ) is native(LIB) returns int32 is export { * }

#
#ZIP_EXTERN int zip_unchange_all(struct zip *);
sub zip_unchange_all(Pointer[zip]  # zip*
                     ) is native(LIB) returns int32 is export { * }

#
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

=head1 INSTALLATION

    sudo apt-get install libzip-dev

=head1 FUNCTIONS

=head2 zip_open

zip_t* zip_open(const char *path, int flags, int *errorp);

L<http://www.nih.at/libzip/zip_open.html>

=head2 zip_close

int zip_close(zip_t *archive);

L<http://www.nih.at/libzip/zip_close.html>

=head1 HACKING

    panda install App::GPTrixie
    gptrixie --all /usr/include/zip.h > zip-generated.pl6
    atom /usr/include/zip.h

=head1 AUTHOR

Ahmad M. Zawawi <ahmad.zawawi@gmail.com>

=head1 COPYRIGHT AND LICENSE

Copyright 2016 Ahmad M. Zawawi under the MIT License

=end pod
