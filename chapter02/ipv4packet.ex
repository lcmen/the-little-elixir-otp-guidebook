defmodule IPv4Packet do
  @doc """
    Parse IP v4 Packet.
  """
  def parse(packet) do
    <<
      version :: size(4),
      ihl :: size(4),
      dscp :: size(6),
      ecn :: size(2),
      total_length :: size(16),
      identification :: size(16),
      flags :: size(3),
      fragment_offset :: size(13),
      ttl :: size(8),
      protocol :: size(8),
      header_checksum :: size(16),
      source_ip :: size(32),
      dest_ip :: size(32),
      options :: size(128)
    >> = packet

    %{
      version: version,
      ihl: ihl,
      dscp: dscp,
      ecn: ecn,
      total_length: total_length,
      identification: identification,
      flags: flags,
      fragment_offset: fragment_offset,
      ttl: ttl,
      protocol: protocol,
      header_checksum: header_checksum,
      source_ip: source_ip,
      dest_ip: dest_ip,
      options: options
    }
  end

  @doc """
    Sample packet to test the parser
  """
  def packet do
    <<
      4 :: size(4), # version
      5 :: size(4), # ihl
      1 :: size(6), # dscp
      1 :: size(2), # ecn
      1 :: size(16), # total_length
      1 :: size(16), # identification
      1 :: size(3), # flags
      1 :: size(13), # fragment_offset
      1 :: size(8), # ttl
      6 :: size(8), # protocol
      1 :: size(16), # header_checksum
      192 :: size(8), 168 :: size(8), 0 :: size(8), 1 :: size(8), # src_ip_address (32 bits)
      192 :: size(8), 168 :: size(8), 0 :: size(8), 2 :: size(8), # dest_ip_address (32 bits)
      1 :: size(128) # rest
    >>
  end
end
