<div>
  
     <div class="card">
              <div class="card-header">
                <h3 class="card-title">DataTable with default features</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>No</th>
                    <th>Nama</th>
                    <th>email</th>
                    <th>Tanggal Lahir</th>
                    <th>Alamat</th>
                  </tr>
                  </thead>
                  <tbody>

@foreach ($datakaryawan as $data => $karyawan)
                        
                    
                  <tr>
                    <td>{{ $loop->iteration }}</td>
                    <td>{{ $karyawan->nama_lengkap }}</td>
                    <td>{{ $karyawan->email }}</td>
                    <td>{{ $karyawan->tanggal }}</td>
                    <td>{{ $karyawan->alamat }}</td>
                  </tr>
@endforeach
                  </tbody>
                  
                </table>
              </div>
              <!-- /.card-body -->
            </div>
</div>
