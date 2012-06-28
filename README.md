siphash-erlang
==============

An Erlang NIF for
[SipHash-2-4](http://131002.net/siphash/)

> SipHash is a family of pseudorandom functions optimized for short
> inputs. Target applications include network traffic authentication and
> hash-table lookups protected against hash-flooding denial-of-service
> attacks. SipHash has well-defined security goals and competitive
> performance.

Usage
-----

    siphash:hash24(Key, Message) -> binary()
        Types:
            Key = binary()
            Message = binary()
        Returns a 8 byte binary, given a 16 byte key and an arbitrary long message.
