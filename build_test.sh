set -exo pipefail

JOBS=-j8

cd dmd/
make "$JOBS" MODEL=64 -f posix.mak clean
make "$JOBS" MODEL=64 -f posix.mak

cd ../druntime
make "$JOBS" MODEL=64 -f posix.mak clean
make "$JOBS" MODEL=64 -f posix.mak
make "$JOBS" MODEL=64 -f posix.mak unittest

cd ../phobos
make "$JOBS" MODEL=64 -f posix.mak clean
make "$JOBS" MODEL=64 -f posix.mak
make "$JOBS" MODEL=64 -f posix.mak unittest

cd ../dmd/test
make "$JOBS" MODEL=64

echo $?

