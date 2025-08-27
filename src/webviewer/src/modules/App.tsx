import React, { useCallback, useState } from 'react';

export const App: React.FC = () => {
  const [fileName, setFileName] = useState<string | null>(null);
  const [status, setStatus] = useState<string>('Ready');

  const onFileSelected = useCallback((event: React.ChangeEvent<HTMLInputElement>) => {
    const file = event.target.files?.[0];
    if (!file) {
      return;
    }
    setFileName(file.name);
    setStatus('File loaded (not parsed)');
    // Parsing/IFC handling will be added in later sprints
  }, []);

  return (
    <div style={{ fontFamily: 'Inter, system-ui, Arial, sans-serif', padding: 16 }}>
      <h1 style={{ margin: 0 }}>BIM Webviewer (MVP)</h1>
      <p style={{ color: '#555' }}>IFC upload → 3D viewer (TBD) → BB clash (TBD)</p>

      <div style={{ display: 'flex', gap: 12, alignItems: 'center', marginTop: 16 }}>
        <input type="file" accept=".ifc,.ifczip,.zip" onChange={onFileSelected} />
        {fileName && <span>Selected: {fileName}</span>}
      </div>

      <div style={{ marginTop: 12, color: '#666' }}>Status: {status}</div>

      <div
        style={{
          marginTop: 24,
          height: 480,
          background: '#0f172a',
          color: '#93c5fd',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          borderRadius: 8,
        }}
      >
        3D viewport placeholder
      </div>
    </div>
  );
};
