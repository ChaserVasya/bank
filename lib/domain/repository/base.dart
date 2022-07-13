abstract class Repository<T> {
  Future<Map<int, T>> getAll();
  Future<T> getByID(int id);
}
